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

/* Buttons for state changes */
#define LV_button 0
#define Precharge_button 0

// /* Tractive state */
//     /* Tractive errors */
//     #define torque_implausibility 0
//     #define torque_disconnect 0
//     #define tractive_stop 0





/* State machine states */
int state_init();
int state_idle();
int state_lv_systems_active();
int state_precharging(void);
int state_tractive(void);
int state_drive(void);
int state_shutdown(void);
int state_error(void);