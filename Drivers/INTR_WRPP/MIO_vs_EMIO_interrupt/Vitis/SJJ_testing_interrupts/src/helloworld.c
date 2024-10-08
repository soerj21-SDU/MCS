#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xgpiops.h"
#include "sleep.h"

int carrier;

// static XGpio axi_pmod1;
static XGpio AXI_LED_Inst;

// static XGpioPs MIO_EMIO_LED_inst;
static XGpioPs MIO_EMIO_LED_inst;
static XGpioPs EMIO_INPUTS_inst;

#define LED_DELAY 	20000000
int Delay;

// PS pins: 
#define MIO_7       7 // MIO LED on Zybo (LD4).

// PL/PS pins: 
#define EMIO_54 	54 //first pin of the EMIO (Bank2) 
#define EMIO_55 	55
#define EMIO_56 	56 // GPIO IN (BTN0)
#define BANK2 		2

#define LED_AXI_ADDRESS XPAR_XGPIO_0_BASEADDR
#define LED_PS_ADDRESS XPAR_XGPIOPS_0_BASEADDR


int main(void)
{
    xil_printf("Hello Zynq MIO EMIO AXI GPIO\n\r");

    // ----------------------------------------------Initialize AXI----------------------------------------------
    // XGpio_Initialize(&axi_pmod1, 0);
    XGpio_Initialize(&AXI_LED_Inst, LED_AXI_ADDRESS);

    //-----------------------------------------------------------------------------------------------------------
	
    XGpioPs_Config *ConfigPtrPS;
    
    ConfigPtrPS = XGpioPs_LookupConfig(LED_PS_ADDRESS);
	XGpioPs_CfgInitialize( &MIO_EMIO_LED_inst, ConfigPtrPS, ConfigPtrPS->BaseAddr );

	// ConfigPtrPS = XGpioPs_LookupConfig(0); 
	// XGpioPs_CfgInitialize(&MIO_EMIO_LED_inst, ConfigPtrPS,
    
    // ----------------------------------------------MIO-LED pin----------------------------------------------

    XGpioPs_SetDirectionPin(&MIO_EMIO_LED_inst, MIO_7, 1); // 1 = output. 
    XGpioPs_SetOutputEnablePin(&MIO_EMIO_LED_inst, MIO_7, 1);

    // XGpioPs_SetDirectionPin(&MIO_EMIO_LED_inst, MIO_10, 1);
    // XGpioPs_SetOutputEnablePin(&MIO_EMIO_LED_inst, MIO_10, 1);

    // ----------------------------------------------EMIO LED Pins---------------------------------------------

    XGpioPs_SetDirectionPin(&MIO_EMIO_LED_inst, EMIO_54, 1);
    XGpioPs_SetOutputEnablePin(&MIO_EMIO_LED_inst, EMIO_54, 1);

    XGpioPs_SetDirectionPin(&MIO_EMIO_LED_inst, EMIO_55, 1);
    XGpioPs_SetOutputEnablePin(&MIO_EMIO_LED_inst, EMIO_55, 1);
    
    // ----------------------------------------------- EMIO BTN -----------------------------------------------

    XGpioPs_SetDirectionPin(&EMIO_INPUTS_inst, EMIO_56, 0); // 0 = input


    while (1) 
    {
        // AXI (LED0 & LED1)
        XGpio_DiscreteWrite(&AXI_LED_Inst, 1, 0xFF);
            for (Delay = 0; Delay < LED_DELAY; Delay++);
        XGpio_DiscreteWrite(&AXI_LED_Inst, 1, 0x00);
            for (Delay = 0; Delay < LED_DELAY; Delay++);

        // MIO7 
        XGpioPs_WritePin(&MIO_EMIO_LED_inst, MIO_7, 0x0);
            for (Delay = 0; Delay < LED_DELAY; Delay++)
        XGpioPs_WritePin(&MIO_EMIO_LED_inst, MIO_7, 0x1);
            for (Delay = 0; Delay < LED_DELAY; Delay++)

        // EMIO
        XGpioPs_WritePin(&MIO_EMIO_LED_inst, EMIO_54, 0x0);
            for (Delay = 0; Delay < LED_DELAY; Delay++);
        XGpioPs_WritePin(&MIO_EMIO_LED_inst, EMIO_54, 0x1);
            for (Delay = 0; Delay < LED_DELAY; Delay++);

        XGpioPs_WritePin(&MIO_EMIO_LED_inst, EMIO_55, 0x0);
            for (Delay = 0; Delay < LED_DELAY; Delay++);
        XGpioPs_WritePin(&MIO_EMIO_LED_inst, EMIO_55, 0x1);
            for (Delay = 0; Delay < LED_DELAY; Delay++);

        carrier = XGpioPs_ReadPin(&EMIO_INPUTS_inst, EMIO_56);
       
        if (carrier == 1) {
            print("BTN0 High\n\r");
        }
        sleep(1);
        print("In while\n\r");
    }
    return 0;
}
