#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"
#include "xtmrctr.h"
#include "xscugic.h"
#include "xil_exception.h"

// Get device IDs from xparameters.h
#define INTC_ID XPAR_PS7_SCUGIC_0_DEVICE_ID

#define BTN_ID XPAR_AXI_GPIO_BTN_DEVICE_ID
#define BTN_CHANNEL 1
#define BTN_INTR_ID XPAR_FABRIC_GPIO_0_VEC_ID

#define LED_ID XPAR_AXI_GPIO_LEDS_DEVICE_ID
#define LED_CHANNEL 1

#define TIMER_ID XPAR_AXI_TIMER_DEVICE_ID
#define TIMER_CHANNEL 0
#define TIMER_INTR_ID XPAR_FABRIC_TMRCTR_0_VEC_ID

// generate a 10ms timer
#define RESET_VALUE 0xFFFFFFFF-(XPAR_AXI_TIMER_CLOCK_FREQ_HZ / 100)

static volatile u32 counter_10ms;
static volatile bool timer_running;
static volatile bool stopping_timer;
static volatile u32 last_value;

void ButtonInterruptHandler(void *CallbackRef)
{
	XGpio *btn_device = (XGpio *)CallbackRef;
	u32 data = XGpio_DiscreteRead(btn_device, BTN_CHANNEL);

	// gpio device for indicator LED
	XGpio_Config *gpio_cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio led_device;
	XGpio_CfgInitialize(&led_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);

	// Get device of timer
	XTmrCtr timer_device;
	XTmrCtr_Config * timer_cfg_ptr = XTmrCtr_LookupConfig(TIMER_ID);
	XTmrCtr_CfgInitialize(&timer_device, timer_cfg_ptr, timer_cfg_ptr->BaseAddress);

	// catcher that timer is not started immediately after stop, trigger on falling edge
	if(stopping_timer == TRUE && data == 0 && last_value > 0)
	{
		stopping_timer = FALSE;
		timer_running=FALSE;
	}
	// Start timer on button release, triggers on falling edge
	else if(timer_running == FALSE && data == 0 && last_value > 0)
	{
		timer_running=TRUE;
		counter_10ms = 0;
		// reset timer
		XTmrCtr_Reset(&timer_device, TIMER_CHANNEL);
		XTmrCtr_Start(&timer_device, TIMER_CHANNEL);

		// Set LED
		u32 led_state = XGpio_DiscreteRead(&led_device, LED_CHANNEL);
		led_state = 1;
		XGpio_DiscreteWrite(&led_device, LED_CHANNEL, led_state);
	}
	// Stop timer on button press, trigger on rising edge
	else if(timer_running == TRUE && data > 0 && last_value ==0)
	{
		XTmrCtr_Stop(&timer_device, TIMER_CHANNEL);
		// clear LED again
		u32 led_state = XGpio_DiscreteRead(&led_device, LED_CHANNEL);
		led_state = counter_10ms;
		XGpio_DiscreteWrite(&led_device, LED_CHANNEL, led_state);

		xil_printf("Duration: %d.%02d\n\r", counter_10ms/100, counter_10ms%100);
		stopping_timer = TRUE;
	}

	last_value = data;
}

void TimerInterruptHandler(void *CallBackRef, u8 TmrCtrNumber)
{
	XGpio_Config *gpio_cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio led_device;
	XGpio_CfgInitialize(&led_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);
	counter_10ms++;

	// Blink LED every 100ms
	if(counter_10ms % 10 == 0)
	{
		u32 data = XGpio_DiscreteRead(&led_device, LED_CHANNEL);
		data ^= 2;
		XGpio_DiscreteWrite(&led_device, LED_CHANNEL, data);
	}
}

int main() {
	XGpio_Config *gpio_cfg_ptr;
	XGpio led_device, btn_device;

	XTmrCtr_Config * timer_cfg_ptr;
	XTmrCtr timer_device;

	XScuGic_Config *intc_cfg;
	XScuGic intc_device;

	xil_printf("Entered function main\r\n");

	// ------------------------------------------------------------------------------
	// Setup LEDs
	// ------------------------------------------------------------------------------
	// Initialize LED Device
	gpio_cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);

	// Set Leds as Output
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);


	// ------------------------------------------------------------------------------
	// Setup Button
	// ------------------------------------------------------------------------------
	// Initialize Button Device
	gpio_cfg_ptr = XGpio_LookupConfig(BTN_ID);
	XGpio_CfgInitialize(&btn_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);

	// Set Buttopn as Input
	XGpio_SetDataDirection(&btn_device, BTN_CHANNEL, 0x1);

	// enable GPIO interrupts
	XGpio_InterruptEnable(&btn_device, BTN_CHANNEL);
	XGpio_InterruptGlobalEnable(&btn_device);

	// ------------------------------------------------------------------------------
	// Setup Timer
	// ------------------------------------------------------------------------------

	// Initialize Timer Device
	timer_cfg_ptr = XTmrCtr_LookupConfig(TIMER_ID);
	XTmrCtr_CfgInitialize(&timer_device, timer_cfg_ptr, timer_cfg_ptr->BaseAddress);

	// Set Timer Handler
	XTmrCtr_SetHandler(&timer_device, TimerInterruptHandler, &timer_device);

	// Set options to auto reload reset value in order to trigger multiple times
	XTmrCtr_SetOptions(&timer_device, TIMER_CHANNEL, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);

	// Set Timer Reset Value
	XTmrCtr_SetResetValue(&timer_device, TIMER_CHANNEL, RESET_VALUE);


	// ------------------------------------------------------------------------------
	// Setup Interrupts
	// ------------------------------------------------------------------------------
	intc_cfg=XScuGic_LookupConfig(INTC_ID);
	int status = XScuGic_CfgInitialize(&intc_device, intc_cfg, intc_cfg->CpuBaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(&intc_device, INTC_ID, 0xA0, 0x3);

	// configure button interrupt with handler
	status = XScuGic_Connect(&intc_device, BTN_INTR_ID,
				 (Xil_ExceptionHandler)ButtonInterruptHandler, &btn_device);
	if (status != XST_SUCCESS) {
		return status;
	}

	// configure timer interrupt, handler is set in timer configuration
	status = XScuGic_Connect(&intc_device, TIMER_INTR_ID,
					 (Xil_ExceptionHandler)XTmrCtr_InterruptHandler, &timer_device);
	if (status != XST_SUCCESS) {
		return status;
	}

	// Enable the interrupt for the devices
	XScuGic_Enable(&intc_device, BTN_INTR_ID);
	XScuGic_Enable(&intc_device, TIMER_INTR_ID);
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

