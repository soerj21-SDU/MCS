#include <stdio.h>
#include "SDC.h"
#include "xparameters.h"

/* States */
/* State machine */
#define ST_INIT               1
#define ST_IDLE               2
#define ST_LV_SYSTEMS_ACTIVE  3  
#define ST_PRECHARGING        4
#define ST_TRACTIVE           5
#define ST_DRIVE              6
#define ST_SHUTDOWN           7 
#define ST_ERROR              0 

#define LV_button 0
#define Precharge_button 0



/* State machine states */
int state_init();
int state_idle();
int state_lv_systems_active();
void state_precharging(void);
void state_tractive(void);
void state_drive(void);
void state_shutdown(void);
void state_error(void);