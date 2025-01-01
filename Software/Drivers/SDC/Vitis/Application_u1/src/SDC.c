#include "includes/SDC.h"
#include <xgpio.h>


XGpio SDC_axi_gpio_inst; 

void SDC_ISR (void *CallbackRef)
{
    XGpio *GpioPtr = (XGpio *)CallbackRef; // set the ptr to point to the instance in the argument. 
    XGpio_InterruptDisable(GpioPtr,GlobalIntrMask);


    const char* broken_node = get_first_broken_node();
    if (strcmp(broken_node, "All nodes are connected") != 0)
    {
        printf("\nSDC broken at: %s\n", broken_node);
    }
    else 
    {
        print("\nAll nodes connected.");
    }

    XGpio_InterruptClear(GpioPtr,  GlobalIntrMask);   
    XGpio_InterruptEnable(GpioPtr,GlobalIntrMask);
}

int init_SDC()
{
    int status;
    print ("\n Setting up SDC AXI GPIO");
    status = setup_AXI_GPIO(SDC_AXI_Address, &SDC_axi_gpio_inst, GPIO_CHANNEL_1, DIR_INPUT);
    
    print ("\n Setting up SDC AXI Interrupt");
    status = setup_GPIO_Interrupt(&SDC_axi_gpio_inst, SDC_AXI_Address, 1, &SDC_ISR);

    return status;
}



void SDC_open_read_as_register(u32* SDC_register) 
{
    *SDC_register = XGpio_DiscreteRead(&SDC_axi_gpio_inst, GPIO_CHANNEL_1);
}


void SDC_open_read_as_array( u32 SDC_array[ NO_OF_SDC_NODES ] )  
{
    u32 temp;
    SDC_open_read_as_register(&temp);


    for (u32 i = 0; i < NO_OF_SDC_NODES; i++) 
    {
        SDC_array[i] = (temp >> i) & 0x01; // Shift right and mask to get the specific bit
    }
}


bool is_SDC_Completed()
{
    uint32_t temp;
    SDC_open_read_as_register(&temp);
    uint32_t mask = (1U << NO_OF_SDC_NODES) - 1; // create a mask with all bits set to 1.

    if ( temp == (!mask) )
    {
        return TRUE;
    }

    return FALSE;
}


const char* get_first_broken_node()
{
    u32 SDC_array[ NO_OF_SDC_NODES ] = {0};

    SDC_open_read_as_array(SDC_array);


    const char* node_array[NO_OF_SDC_NODES] = 
    {
        "Shutdown Circuit Supply", 
        "Cockpit Emergency Button",
        "BOTS",
        "Inertia",
        "Left Emergency Button",
        "Right Emergency Button",
        "Front Right Wheel",
        "Front Left Wheel",
        "Rear Right Wheel",
        "Rear Left Wheel",
        "HV Connector TSAC",
        "IMD TSAC",
        "AMS TSAC",
        "BSPD",
        "HVD",
        "TSMP",
        "TSMS"
    };

    for (int i = 0; i < NO_OF_SDC_NODES; i++) 
    {
        if (SDC_array[i] == SDC_BROKEN_NODE_STATE) 
        {  
            return node_array[i];  
        }
    }

    return "All nodes are connected";   
}

bool get_SDC_Cockpit_Emergency_Btn_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> Cockpit_emergency_index)   &    0x01  );
}
 
bool get_SDC_BOTS_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> BOTS_index) & 0x01 );
}

bool get_SDC_inertia_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> inertia_index) & 0x01 );
}

bool get_SDC_L_emergency_Btn_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> L_emergency_btn_index) & 0x01 );
}

bool get_SDC_R_emergency_Btn_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> R_emergency_btn_index) & 0x01 );
}


bool get_SDC_FR_Wheel_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> FR_wheel_index) & 0x01 );
}

bool get_SDC_FL_Wheel_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> FL_wheel_index) & 0x01 );
}

bool get_SDC_RR_Wheel_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> RR_wheel_index) & 0x01 );
}

bool get_SDC_RL_Wheel_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> RL_wheel_index) & 0x01 );
}

        bool get_SDC_HV_Connector_TSAC_Status()
        {
            //receive status info from the AMS via CAN. 
            return 1; 
        }

        bool get_SDC_IMD_TSAC_Status()
        {
            //receive status info from the AMS via CAN. 
            return 1;
        }

        bool get_SDC_AMS_TSAC_Status()
        {
            //receive status info from the AMS via CAN. 
            return 1;
        }

bool get_SDC_BSPD_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> BSPD_index) & 0x01 );
}

bool get_SDC_HVD_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> HVD_index) & 0x01 );
}

bool get_SDC_TSMP_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> TSMP_index) & 0x01 );
}

bool get_SDC_TSMS_Open_Status()
{
    uint8_t temp; 
    SDC_open_read_as_register((uint32_t *) &temp);
    return ( (temp >> TSMS_index) & 0x01 );
}

// I assume that these two functions should be part of the AMS, not the MC.
        // void SDC_RESET_TSAC()
        // {
        //     //take the input from the reset button on the panel (via CAN)
        // }

        // void SDC_Enable (bool en_sc)
        // {
        //     //take the input from the steering wheel (via CAN)

        //     // write to the AMS to enable the last relay of the SDC
        //     SDC_write
        // }
