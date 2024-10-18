#include "SDC.h"



int init_SDC()
{
    int status = XGpio_Initialize(&SDC_axi_inst, SDC_AXI_Address);
        if (status != XST_SUCCESS)
        {
        	xil_printf("Failed to setup Shutdown GPIOs\r\n");
            return XST_FAILURE;
        }
	XGpio_SetDataDirection(&SDC_axi_inst, GPIO_CHANNEL_2, DIR_INPUT);

    return status;
}


uint32_t* SDC_read() 
{
    static uint32_t SDC_Array[ NO_OF_SDC_NODES ];  

    for (int i = 0; i < NO_OF_SDC_NODES; i++) 
    {
        SDC_Array[i] = XGpio_DiscreteRead(&SDC_axi_inst, GPIO_CHANNEL_1); 
    }

    return SDC_Array; 
}


bool get_SDC_Cockpit_Emergency_Btn_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[Cockpit_emergency_index] != 0; 
}

bool get_SDC_BOTS_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[ BOTS_index ] != 0; 
}

bool get_SDC_inertia_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[ BOTS_index ] != 0; 
}

bool get_SDC_L_emergency_Btn_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[ L_emergency_btn_index ] != 0; 
}

bool get_SDC_R_emergency_Btn_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[ R_emergency_btn_index ] != 0; 
}

bool get_SDC_IMD_Status()
{
    uint32_t* SDC_Array;  
    SDC_Array = SDC_read(); 

    return SDC_Array[IMD_TSAC_Index] != 0;  // Return true if the value is non-zero, otherwise false
}





#define Cockpit_emergency_index  0
#define  BOTS_index              1
#define  inertia_index           2
#define  L_emergency_btn_index   3
#define  R_emergency_btn_index   4
#define  FR_wheel_index          5
#define  FL_wheel_index          6
#define  RR_wheel_index          7
#define  RL_wheel_index          8
#define  HV_CONNECTOR_TSAC_index 9
#define  IMD_TSAC_Index          10
#define  AMS_TSAC_index          11
#define  BSPD_index              12
#define  HVD_index               13
#define  TSMP_index              14
#define  TSMS_index              15



// bool SC_END()
// {
// 	shutdown_read();
// 	return shutdown_input & (1 << 7);
// }

// bool Latch_Reset()
// {
// 	shutdown_read();
// 	return shutdown_input & (1 << 8);
// }

// void AMS_SC(bool ams_sc)
// {
// 	shutdown_output &= ~(1 << 0);
// 	shutdown_output += ((ams_sc != 0) << 0);
// 	shutdown_write();
// }
// void EN_SC(bool en_sc)
// {
// 	shutdown_output &= ~(1 << 1);
// 	shutdown_output += ((en_sc != 0) << 1);
// 	shutdown_write();
// }
