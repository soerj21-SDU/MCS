/*
 * shunt.c
 *
 *  Created on: May 3, 2020
 *      Author: soeren
 */


#include "shunt.h"

static bool i_big_endian = true; // Make it as a struct to a instance.

uint8_t decode_result_message(uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc);




uint8_t Shunt_DecodeCurrentMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// Units 1mA
	if(frm_data[0] != SHUNT_MUXID_MSG_RESULT_I) //  MUXID for IVT_Msg_Result_I is 0x00
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}

uint8_t Shunt_DecodeVoltageMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// UNIT = 1 mV
	// Voltage of U1-U3
	if(frm_data[0]< SHUNT_MUXID_MSG_RESULT_U1 && frm_data[0] >SHUNT_MUXID_MSG_RESULT_U3) //  MUXID NOT [U1-U3]
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}

uint8_t Shunt_DecodeTempMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// UNIT = 0.1 celcuius
	if(frm_data[0]!=SHUNT_MUXID_MSG_RESULT_T) //  MUXID NOT [U1-U3]
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}

uint8_t Shunt_DecodePowerMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// UNIT = 1 W
	if(frm_data[0]!=SHUNT_MUXID_MSG_RESULT_W) //  MUXID NOT [U1-U3]
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}
uint8_t Shunt_DecodeCurrentCounterMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// UNIT = 1 As

	if(frm_data[0]!=SHUNT_MUXID_MSG_RESULT_AS) //  MUXID NOT [U1-U3]
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}

uint8_t Shunt_DecodeEnergyMsg( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc, uint8_t msg_id)
{
	// UNIT = 1Wh

	if(frm_data[0]!=SHUNT_MUXID_MSG_RESULT_WH) //  MUXID NOT [U1-U3]
	{
		return SHUNT_FAILED;
	}

	return decode_result_message(frm_data,msg,msg_dlc);
}





// Decode IVT result message as seen on page 21 in datasheet v1.0.1
uint8_t decode_result_message( uint8_t *frm_data, SHUNT_MSG_RESULT_t *msg, uint8_t msg_dlc)
{
	// First check message ID is correct.
	// Check that the message length(dlc) is the correct length.

	if( msg_dlc != 6 ) // Hardcoded from shunt protocol.
	{
		return SHUNT_FAILED;
	}

	msg->counter= frm_data[0] && 0x0F;
	uint8_t error = frm_data[0] && 0xF0;

	if(error & 2) // BIT 1 is set, this means this result is bad
	{
	return SHUNT_MEASSUREMENT_ERROR;

	}
	if(error & 4) // BIT 2 is set, any measurement have an error
	{
		return SHUNT_MEASSUREMENT_ERROR;
	}
	if(error & 8)
	{
		return SHUNT_SYSTEM_ERROR;
	}

	// If config is BIG ENDIAN(default)
	// Make antoher if for Little ENDIAN

	// BIG ENDIAN // MSB FØRST
	if(i_big_endian)
	{
		int32_t  data = 0;

		data =  (frm_data[2] <<24);
		data |= (frm_data[3] << 16);
		data |= (frm_data[4] << 8);
		data |= (frm_data[5]);

		msg->data = data;

		//current = current/100; // Do down to 10ms resoultion
	}




	return SHUNT_SUCESS;


}

