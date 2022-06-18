#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xttcps.h"
#include "xstatus.h"
#include "xtime_l.h"


// Get device IDs from xparameters.h
#define INTC_ID XPAR_PS7_SCUGIC_0_DEVICE_ID

#define BTN_ID XPAR_AXI_GPIO_BTN_LED_DEVICE_ID
#define BTN_CHANNEL 1
#define BTN_ID_FUNC 1
#define BTN_ID_SW 2
#define BTN_ID_RST 4
#define BTN_INTR_ID XPAR_FABRIC_GPIO_0_VEC_ID

//#define LED_ID XPAR_AXI_GPIO_LEDS_DEVICE_ID
#define LED_CHANNEL 2

#define TIMER_ID XPAR_PS7_TTC_0_DEVICE_ID//XPAR_AXI_TIMER_DEVICE_ID
#define TIMER_INTR_ID XPS_TTC0_0_INT_ID
#define TIMER_FREQUENCY_HZ 100

// generate a 10ms timer
#define TIMER_10MS  COUNTS_PER_SECOND / 100
#define TIMER_100MS COUNTS_PER_SECOND / 10
#define TIMER_1S    COUNTS_PER_SECOND

void ButtonInterruptHandler(void *CallbackRef)
{
	static XTime tStart, tEnd;
	static bool display_10ms;
	static volatile u32 counter_10ms;
	static volatile u32 counter_1s;
	static volatile bool timer_running;
	static volatile u32 last_value;

	XGpio *btn_led_device = (XGpio *)CallbackRef;
	u32 data = XGpio_DiscreteRead(btn_led_device, BTN_CHANNEL);

	// Reset Timer
	if( (data & BTN_ID_RST) > 0)
	{
		timer_running=FALSE;
		XGpio_DiscreteWrite(btn_led_device, LED_CHANNEL, 0);
	}
	else if(timer_running == FALSE && (data & BTN_ID_SW) > 0 && (last_value & BTN_ID_SW) ==0)
	{
		if(display_10ms == FALSE)
		{
			XGpio_DiscreteWrite(btn_led_device, LED_CHANNEL, 0x80 | counter_10ms);
			display_10ms = TRUE;
		}
		else
		{
			XGpio_DiscreteWrite(btn_led_device, LED_CHANNEL, counter_1s);
			display_10ms = FALSE;
		}
	}
	// Start timer on button release, triggers on falling edge
	else if(timer_running == FALSE && (data & BTN_ID_FUNC) > 0 && (last_value & BTN_ID_FUNC) ==0)
	{
		timer_running=TRUE;
		counter_10ms = 0;
		counter_1s = 0;

		XTime_GetTime(&tStart);

		// Set LED
		XGpio_DiscreteWrite(btn_led_device, LED_CHANNEL, 0xFF);
	}
	// Stop timer on button press, trigger on rising edge
	else if(timer_running == TRUE && (data & BTN_ID_FUNC) > 0 && (last_value & BTN_ID_FUNC) ==0)
	{
		XTime_GetTime(&tEnd);
		int cycles = 2*(tEnd - tStart);
		counter_1s = cycles/COUNTS_PER_SECOND;
		counter_10ms = cycles/(COUNTS_PER_SECOND/100);
		XGpio_DiscreteWrite(btn_led_device, LED_CHANNEL, counter_1s);
		xil_printf("Duration: %d.%02d\n\r", counter_1s, counter_10ms);
		display_10ms =FALSE;
		timer_running=FALSE;
	}

	last_value = data;
}

int main() {
	int status;

	XGpio_Config *gpio_cfg_ptr;
	XGpio btn_led_device;

	XScuGic_Config *intc_cfg;
	XScuGic intc_device;

	xil_printf("Entered function main\r\n");

	// ------------------------------------------------------------------------------
	// Setup Buttons and LEDs
	// ------------------------------------------------------------------------------
	// Initialize Button Device
	gpio_cfg_ptr = XGpio_LookupConfig(BTN_ID);
	XGpio_CfgInitialize(&btn_led_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);

	// Set Buttopn as Input
	XGpio_SetDataDirection(&btn_led_device, BTN_CHANNEL, 0x7);
	XGpio_SetDataDirection(&btn_led_device, LED_CHANNEL, 0);

	// enable GPIO interrupts
	XGpio_InterruptEnable(&btn_led_device, BTN_CHANNEL);
	XGpio_InterruptGlobalEnable(&btn_led_device);

	// ------------------------------------------------------------------------------
	// Setup Interrupts
	// ------------------------------------------------------------------------------
	intc_cfg=XScuGic_LookupConfig(INTC_ID);
	status = XScuGic_CfgInitialize(&intc_device, intc_cfg, intc_cfg->CpuBaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// configure button interrupt with handler
	status = XScuGic_Connect(&intc_device, BTN_INTR_ID,
				 (Xil_ExceptionHandler)ButtonInterruptHandler, &btn_led_device);
	if (status != XST_SUCCESS) {
		return status;
	}

	// Enable the interrupt for the devices
	XScuGic_Enable(&intc_device, BTN_INTR_ID);
	// Register exceptions and enable them
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler, &intc_device);
	Xil_ExceptionEnable();

	// ------------------------------------------------------------------------------
	// Setup Finished
	// ------------------------------------------------------------------------------
	// Application is handled via interrupts
	while (1) {}
}

