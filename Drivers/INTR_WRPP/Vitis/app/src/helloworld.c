// #include "xparameters.h"
// #include "xgpio.h"
// #include "xscugic.h"
// #include "xil_exception.h"
// #include "xil_printf.h"
// // Parameter definitions
// #define INTC_DEVICE_ID XPAR_PS7_SCUGIC_0_DEVICE_ID
// #define BTNS_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
// #define LEDS_DEVICE_ID XPAR_AXI_GPIO_1_DEVICE_ID
// #define INTC_GPIO_INTERRUPT_ID XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
// #define BTN_INT XGPIO_IR_CH1_MASK

// XGpio LEDInst, BTNInst;
// XScuGic INTCInst;
// static int led_data;
// static int btn_value;

// //----------------------------------------------------
// // PROTOTYPE FUNCTIONS
// //----------------------------------------------------
// static void BTN_Intr_Handler(void *InstancePtr);
// static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
// static int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr);


// int main (void)
// {
//     int status;
//     status = XGpio_Initialize(&LEDInst, XPAR_XGPIO_1_BASEADDR);
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }
    
//     status = XGpio_Initialize(&BTNInst, XPAR_XGPIO_0_BASEADDR);
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }

//     XGpio_SetDataDirection(&LEDInst, 1, 0x00);    // Set LEDs direction to outputs
//     XGpio_SetDataDirection(&BTNInst, 1, 0xFF);    // Set all buttons direction to inputs

//     // Initialize interrupt controller
//     status = IntcInitFunction(INTC_DEVICE_ID, &BTNInst);
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }

//     while(1);
//     return 0;
// }

// //----------------------------------------------------
// // FUNCTION DEFINITIONS
// //----------------------------------------------------
// void BTN_Intr_Handler(void *InstancePtr)
// {
//     XGpio_InterruptDisable(&BTNInst, BTN_INT);    // Disable GPIO interrupts

//     // Ignore additional button presses
//     if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) !=BTN_INT) 
//     {
//         return;
//     }

//     btn_value = XGpio_DiscreteRead(&BTNInst, 1);

//     // Increment counter based on button value. Reset if center button pressed
//     if(btn_value != 8)
//     {
//         led_data = led_data + btn_value;
//     }
//     else
//     {
//         led_data = 0;
//     }

//     XGpio_DiscreteWrite(&LEDInst, 1, led_data);

//     (void) XGpio_InterruptClear(&BTNInst, BTN_INT);

//     XGpio_InterruptEnable(&BTNInst, BTN_INT);    // Enable GPIO interrupts
// }


// // int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr)
// int IntcInitFunction(u32 BaseAddress, XGpio *GpioInstancePtr)
// {
//     XScuGic_Config *IntcConfig;
//     int status;

//     // Interrupt controller initialization
//     IntcConfig = XScuGic_LookupConfig(BaseAddress);
//     status = XScuGic_CfgInitialize(&INTCInst, IntcConfig,
//     IntcConfig->CpuBaseAddress);
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }

//     // Call to interrupt setup
//     status = InterruptSystemSetup(&INTCInst);
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }

//     // Connect GPIO interrupt to handler
//     status = XScuGic_Connect
//     (
//         &INTCInst,
//         // INTC_GPIO_INTERRUPT_ID, 
//         INTC_GPIO_INTERRUPT_ID, //GIVER NOK PROBLEMER.

//         (Xil_ExceptionHandler) BTN_Intr_Handler,
//         (void *)GpioInstancePtr
//     );
//     if(status != XST_SUCCESS) 
//     {
//         return XST_FAILURE;
//     }

//     // Enable GPIO interrupts interrupt
//     XGpio_InterruptEnable(GpioInstancePtr, 1);
//     XGpio_InterruptGlobalEnable(GpioInstancePtr);

//     // Enable GPIO interrupts in the controller
//     XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

//     return XST_SUCCESS;
// }


// int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
// {
// // Enable interrupt
// XGpio_InterruptEnable(&BTNInst, BTN_INT);
// XGpio_InterruptGlobalEnable(&BTNInst);
// Xil_ExceptionRegisterHandler
// (
//     XIL_EXCEPTION_ID_INT,
//     (Xil_ExceptionHandler) XScuGic_InterruptHandler,
//     XScuGicInstancePtr
// );

// Xil_ExceptionEnable();

// return XST_SUCCESS;
// }