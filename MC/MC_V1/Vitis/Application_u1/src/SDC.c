#include "includes/SDC.h"


XGpio SDC_axi_gpio_inst; 

void SDC_ISR (void *CallbackRef)
{
    XGpio *GpioPtr = (XGpio *)CallbackRef;

    const char* broken_node = get_first_broken_node();

    printf("\nSDC broken at: %s\n", broken_node);
    
    if (broken_node != "All nodes are connected" )
    {
    }

    XGpio_InterruptClear(GpioPtr,  GlobalIntrMask);     
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


uint32_t  SDC_read_as_register (uint32_t *SDC_register)
{
    return *SDC_register = XGpio_DiscreteRead(&SDC_axi_gpio_inst, GPIO_CHANNEL_1); 
}


void SDC_read_as_array( uint32_t uint32_array[ NO_OF_SDC_NODES ] )  
{
    uint32_t temp;
    SDC_read_as_register(&temp);

    for (uint32_t i = 0; i < NO_OF_SDC_NODES; i++) 
    {
        uint32_array[i] = (temp >> i) & 0x01; // Shift right and mask to get the specific bit
    }
}


bool is_SDC_Completed()
{
    uint32_t temp;
    SDC_read_as_register(&temp);

    uint32_t mask = (1U << NO_OF_SDC_NODES) - 1; // create a mask with all bits set to 1.

    if ( temp != mask ) 
    {
        return FALSE;
    }

    return TRUE;
}


const char* get_first_broken_node()
{
    uint32_t SDC_array[ NO_OF_SDC_NODES ] = {0};

    SDC_read_as_array(SDC_array);


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

bool get_SDC_Cockpit_Emergency_Btn_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> Cockpit_emergency_index)   &    0x01  );
}
 
bool get_SDC_BOTS_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> BOTS_index) & 0x01 );
}

bool get_SDC_inertia_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> inertia_index) & 0x01 );
}

bool get_SDC_L_emergency_Btn_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> L_emergency_btn_index) & 0x01 );
}

bool get_SDC_R_emergency_Btn_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> R_emergency_btn_index) & 0x01 );
}


bool get_SDC_FR_Wheel_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> FR_wheel_index) & 0x01 );
}

bool get_SDC_FL_Wheel_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> FL_wheel_index) & 0x01 );
}

bool get_SDC_RR_Wheel_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> RR_wheel_index) & 0x01 );
}

bool get_SDC_RL_Wheel_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
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

bool get_SDC_BSPD_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> BSPD_index) & 0x01 );
}

bool get_SDC_HVD_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> HVD_index) & 0x01 );
}

bool get_SDC_TSMP_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
    return ( (temp >> TSMP_index) & 0x01 );
}

bool get_SDC_TSMS_Status()
{
    uint8_t temp; 
    SDC_read_as_register((uint32_t *) &temp);
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
