#include <stdint.h>
#include <stdio.h>
#include <xgpio.h>
#include <xstatus.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"

#include "sdc.h"
#include "states.h"
#include "GPIO.h"

#include "interrupts.h"


#define AXI_GPIO_ADDRESS XPAR_AXI_GPIO_0_BASEADDR

int DELAY = 100000000;

// state = ST_INIT;




int main()
{

    int status; 

    init_platform();

while(1)
{
    switch (state) 
    {
        case (ST_INIT) : //---------------------------------------
        {
            print ("\n In INIT state");

            status = init_SDC();
                if (status != XST_SUCCESS)
                {
                    print ("I died at SDC initialization.");
                    return XST_FAILURE;
                }


            state = ST_IDLE;
            break;
        }

        case (ST_IDLE) : //---------------------------------------
        {
            print ("\n In IDLE state");
            for(int i = 0; i < DELAY; i++) {};


            break; 
        }

        case (ST_LV_SYSTEMS_ACTIVE) : //---------------------------
        {
        //activate ProFETs
            break;
        }

        case (ST_PRECHARGING) : //---------------------------------
        {
        // enable SDC if able
        // close precharge contactor
            break; 
        }

        case (ST_TRACTIVE) : //------------------------------------
        {
        

            break; 
        }

        case (ST_DRIVE) : //---------------------------------------
        {
            break; 
        }
        
        case (ST_ERROR) : //---------------------------------------
        {
            print ("I am in error");
            for(int i = 0; i < DELAY; i++) {};

            //Communication error
            //communication lost
            // timeouts
            // SDC opens
            break; 
        }
			// gStateMachine.status.stateName := 'Initialize';
			// stateInit;
			// stateChangeInit;

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
    }
} 
} 
