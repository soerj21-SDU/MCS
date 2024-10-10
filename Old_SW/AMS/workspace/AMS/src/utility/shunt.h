/*
 * shunt.h
 *
 *  Created on: May 3, 2020
 *      Author: soeren
 */

#ifndef SRC_UTILITY_SHUNT_H_
#define SRC_UTILITY_SHUNT_H_

#include "../global_def.h"

#define SHUNT_DEFAULT_CAN_MSG_COMMAND_ID  	0x411
#define SHUNT_DEFAULT_CAN_MSG_DEBUG_ID    	0x510
#define SHUNT_DEFAULT_CAN_MSG_REPSONE_ID  	0x511
#define SHUNT_DEFAULT_CAN_MSG_RESULT_I_ID 	0x521
#define SHUNT_DEFAULT_CAN_MSG_RESULT_U1_ID 	0x522
#define SHUNT_DEFAULT_CAN_MSG_RESULT_U2_ID 	0x523
#define SHUNT_DEFAULT_CAN_MSG_RESULT_U3_ID 	0x524
#define SHUNT_DEFAULT_CAN_MSG_RESULT_T_ID 	0x525
#define SHUNT_DEFAULT_CAN_MSG_RESULT_W_ID 	0x526
#define SHUNT_DEFAULT_CAN_MSG_RESULT_AS_ID 	0x527
#define SHUNT_DEFAULT_CAN_MSG_RESULT_Wh_ID 	0x528
// For now the Default messages are used. It is possible to change them.

// Each message type have a struct assosiated with it.

#define SHUNT_MUXID_MSG_RESULT_I	0x00
#define SHUNT_MUXID_MSG_RESULT_U1 	0x01
#define SHUNT_MUXID_MSG_RESULT_U2 	0x02
#define SHUNT_MUXID_MSG_RESULT_U3 	0x03
#define SHUNT_MUXID_MSG_RESULT_T 	0x04
#define SHUNT_MUXID_MSG_RESULT_W 	0x05
#define SHUNT_MUXID_MSG_RESULT_AS 	0x06
#define SHUNT_MUXID_MSG_RESULT_WH 	0x07


typedef struct {
	uint8_t counter;
	int32_t data;

}SHUNT_MSG_RESULT_t;

typedef enum
{
	SHUNT_SUCESS=0,
	SHUNT_FAILED,
	SHUNT_MEASSUREMENT_ERROR,
	SHUNT_SYSTEM_ERROR

}SHUNT_RESULT;

uint8_t Shunt_DecodeCurrentMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);
uint8_t Shunt_DecodeVoltageMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);
uint8_t Shunt_DecodeTempMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);
uint8_t Shunt_DecodePowerMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);
uint8_t Shunt_DecodeCurrentCounterMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);
uint8_t Shunt_DecodeEnergyMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id);

#endif /* SRC_UTILITY_SHUNT_H_ */
