#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"

// Get device IDs from xparameters.h
#define SW_ID XPAR_AXI_GPIO_SWITCHES_DEVICE_ID
#define LED_ID XPAR_AXI_GPIO_LEDS_DEVICE_ID
#define SW_CHANNEL 1
#define LED_CHANNEL 1

int main() {
	XGpio_Config *cfg_ptr;
	XGpio led_device, sw_device;
	u32 data, last_data;

	xil_printf("Entered function main\r\n");

	// Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Initialize Button Device
	cfg_ptr = XGpio_LookupConfig(SW_ID);
	XGpio_CfgInitialize(&sw_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Switches as Input
	XGpio_SetDataDirection(&sw_device, SW_CHANNEL, 0xFF);

	// Set Led as Output
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);


	while (1) {
		data = XGpio_DiscreteRead(&sw_device, SW_CHANNEL);
		if(data != last_data)
		{
			last_data = data;
			// method taken from
			// https://en.wikipedia.org/wiki/Gray_code#Converting_to_and_from_Gray_code
			data = data ^(data >> 1);

			xil_printf("%2x(", last_data);
			for(u8 i=15;i<16;i--)
			{
				xil_printf("%i", (last_data >> i)&1);
			}
			xil_printf("):%2x(", data);
			for(u8 i=15;i<16;i--)
			{
				xil_printf("%i",(data >> i)&1);
			}
			xil_printf(")\n");
			XGpio_DiscreteWrite(&led_device, LED_CHANNEL, data);
		}
	}
}

