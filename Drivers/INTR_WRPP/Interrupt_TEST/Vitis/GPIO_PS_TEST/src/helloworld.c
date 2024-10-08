

#include "xgpiops.h"
#include "xparameters.h"
#include "xil_exception.h"
#include <xil_printf.h>
#include "sleep.h"

// Define the pin and bank
#define MIO_BTN 51
#define MIO_LED 7 


#define LED_PS_ADDRESS XPAR_XGPIOPS_0_BASEADDR

// GPIO instance
XGpioPs GpioPS;

int carrier;

// void Interrupt_BTN_51(){

//     XGpioPs_IntrClear()
// }

int main() {
    print("Starting program\n\r");
    int Status;
    print("Initialaizing GPIOPS_config\n\r");

    XGpioPs_Config *ConfigPtrPS;
    
    ConfigPtrPS = XGpioPs_LookupConfig(LED_PS_ADDRESS);
	XGpioPs_CfgInitialize( &GpioPS, ConfigPtrPS, ConfigPtrPS->BaseAddr);


    print("LED_TEST\n\r");
    XGpioPs_SetDirectionPin(&GpioPS, MIO_LED, 1); // 1 = output. 
    XGpioPs_SetOutputEnablePin(&GpioPS, MIO_LED, 1);
    XGpioPs_WritePin(&GpioPS, MIO_LED, 0x1);
    sleep(1);
    XGpioPs_WritePin(&GpioPS, MIO_LED, 0x0);

    print("Initialaizing pin MIO51");
    
    XGpioPs_SetDirectionPin(&GpioPS, MIO_BTN, 0); // 0 = input. 
   
    while (1) {
        print("In main\n\r");
        sleep(1);
        carrier = XGpioPs_ReadPin(&GpioPS, MIO_BTN);
        XGpioPs_WritePin(&GpioPS, MIO_LED, 0x0);
        if(carrier == 1){
            XGpioPs_WritePin(&GpioPS, MIO_LED, 0x1);
        }
    }

    return 0;
}
