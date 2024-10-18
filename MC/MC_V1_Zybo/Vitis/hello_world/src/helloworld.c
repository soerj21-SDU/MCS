#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xparameters_ps.h"

#include "states.h"

#define ST_INIT               1
#define ST_IDLE               2
#define ST_LV_SYSTEMS_ACTIVE  3  
#define ST_PRECHARGING        4
#define ST_TRACTIVE           5
#define ST_DRIVE              6 
#define ST_ERROR              0 

uint8_t state = ST_INIT;


int main()
{
    init_platform();

    switch (state) 
    {
        case (ST_INIT) : 
        {
            st_Init();
            state = ST_IDLE;

            break; 
        }
        
        case (ST_IDLE) : 
        {
            break; 
        }

        case (ST_LV_SYSTEMS_ACTIVE) : 
        {
            break;
        }

        case (ST_PRECHARGING) :
        {
            break; 
        }

        case (ST_TRACTIVE) :  
        {
            break; 
        }

        case (ST_DRIVE) :
        {
            break; 
        }
        
        case (ST_ERROR) :
        {
            break; 
        }
    }
			// gStateMachine.status.stateName := 'Initialize';
			// stateInit;
			// stateChangeInit;

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
}

