// #include <stdio.h>
// #include <xstatus.h>
// #include "xil_printf.h"
// #include "xil_types.h"
// #include "xparameters.h"
// #include "xadcps.h"
// #include "platform.h"
 
 
// #define XADC_DEVICE_ID XPAR_SYSMON_0_DEVICE_ID
// // #define XADC_DEVICE_ID XPAR_XADC_WIZ_0_BASEADDR 
 
// #define LSB_BITS_NOT_USED 4
// #define TEMP_CONV_FACTOR 503.975/4096
// #define TEMP_CONV_TERM -273.15
// #define VOLT_CONV_FACTOR 3.0 / 4096
 
// static XAdcPs_Config *xadc_cfg;
// static XAdcPs xadc_ctl;
 
 
 
 
// int main()
// {
//         init_platform();
//         print("Hello World\n\r");

//    s32 status;
//    u16 temp, vccint, vccaux, vbram, vccpint, vccpaux, vccpdro;
 
//     //initalize ADC controller
//     xadc_cfg = XAdcPs_LookupConfig(XADC_DEVICE_ID);
 
//     if (NULL == xadc_cfg)
//     {
//         return XST_FAILURE;
//     }

//     print("How r u\n\r");

//     status = XAdcPs_CfgInitialize(&xadc_ctl, xadc_cfg, xadc_cfg->BaseAddress);
 
//     if (status != XST_SUCCESS)
//     {
//         return XST_FAILURE;
//     }
   
//     //set XADC mode
//     XAdcPs_SetSequencerMode(&xadc_ctl, XADCPS_SEQ_MODE_CONTINPASS);
 
//     // get all the samples
//     temp    = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_TEMP);
//     vccint  = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VCCINT);
//     vccaux  = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VCCAUX);
//     vbram   = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VBRAM);
//     vccpint = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VCCPINT);
//     vccpaux = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VCCPAUX);
//     vccpdro = XAdcPs_GetAdcData(&xadc_ctl, XADCPS_CH_VCCPDRO);
 
 
//     printf("Die temperature: %.2f C\n", ( (float) (temp >> LSB_BITS_NOT_USED)) * TEMP_CONV_FACTOR + TEMP_CONV_TERM  );
 
//             cleanup_platform();
//     return XST_SUCCESS;
    


// }



// //_----------------------------------

// // #include <stdio.h>
// // #include "platform.h"
// // #include "xil_printf.h"


// // int main()
// // {
// //     init_platform();

// //     print("Hello World\n\r");
// //     print("Successfully ran Hello World application");
// //     cleanup_platform();
// //     return 0;
// // }
