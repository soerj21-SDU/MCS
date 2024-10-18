#include "sdc.h"

#define ST_INIT               1
#define ST_IDLE               2
#define ST_LV_SYSTEMS_ACTIVE  3  
#define ST_PRECHARGING        4
#define ST_TRACTIVE           5
#define ST_DRIVE              6 
#define ST_ERROR              0 



void st_Init()
{
        // initialize Zynq
    init_SDC();
}

