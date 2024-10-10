/*
 * CAN_Rx_Task.c
 *
 *  Created on: Mar 18, 2020
 *      Author: soeren
 */

#include "CAN_Rx_Task.h"


void printCanMessage(CANFRM frame);
void decode_command_message(CANFRM * frame,uint8_t *command, uint8_t* bank_count_set_by_car);
void decode_charger_status_message(CANFRM * frame, uint8_t *charge_command, uint8_t *charger_status, uint8_t *charger_counter);
void decode_debug_message(CANFRM * frame, uint8_t * debug_byte1,uint8_t * debug_byte2,uint8_t * debug_byte3,uint8_t * debug_byte4,uint8_t * debug_byte5,uint8_t * debug_byte6,uint8_t * debug_byte7,uint8_t * debug_byte8);
OS_ERR CAN_RX_createTask()
{
	OS_ERR err;

    OSTaskCreate(&CAN_RX_TCB,                      //  - RX Task.
                 "CAN RX Task",
				 CAN_RX_Task,
				 0,          				//argument for task. None for the moment
				 CAN_RX_TASK_PRIO,
				 &CAN_RxTaskStk[0],
				 CAN_RX_TASK_STK_SIZE/10,
				 CAN_RX_TASK_STK_SIZE,
				 CAN_RX_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &err);

    return err;

}
void CAN_RX_Task(void *arg)
{
	CANFRM can_frm;
	CanBusIoCtl(ZC7xxx_CAN_BUS_0, CANBUS_SET_RX_TIMEOUT, 0u);   // Set Timeout to wait forever for new CAN Msg.

	UCOS_Printf("CAN_RX_TASK Started\n\r");
	OS_ERR os_err;
	uint8_t charger_counter=0;
	bool blink = false;
	while(1)
	{
		CanBusRead(ZC7xxx_CAN_BUS_0,
				(void *)&can_frm,
				sizeof(CANFRM)
				);
		// The task wake up here when a can frame has been recivced.

		if(can_frm.Identifier == CAN_BASEADDR + CAN_MSG_COMMAND_ID)
		{
			g_charger_connected = false;
			OSMutexPend(&g_mutex_status_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);


			if(os_err == OS_ERR_NONE)
			{
				uint8_t command;
				decode_command_message(&can_frm,&command,&g_bank_count_set_by_Car);
				OSTaskQPost(&Controller_Task_TCB,&command,sizeof(command),OS_OPT_POST_FIFO,&os_err);
				OSMutexPost(&g_mutex_status_block,OS_OPT_POST_NONE,&os_err);
			}
			//command_signal = (can_frm.Data[0] & 7);
		}
		else if(can_frm.Identifier == 0x310) //CAN_MSG_CHARGER_COMMAND_ID
		{
			g_charger_connected = true;
			uint8_t charger_command;

			decode_charger_status_message(&can_frm,&charger_command,&g_charger_status, &charger_counter);
			uint8_t command;
			if(charger_command == 1)
			{
				command = Charge_Start;
				OSTaskQPost(&Controller_Task_TCB,&command,sizeof(command),OS_OPT_POST_FIFO,&os_err);
			}
			else if(charger_command == 2)
			{
				command = Charge_STOP;
				OSTaskQPost(&Controller_Task_TCB,&command,sizeof(command),OS_OPT_POST_FIFO,&os_err);

			}
			OSTaskQPost(&Controller_Task_TCB,&charger_command,sizeof(charger_command),OS_OPT_POST_FIFO,&os_err);



		}
		else if( can_frm.Identifier == 0x611) // DEBUG
		{
			UCOS_Printf("RECVIED A DEBUG CAN MESSAGE /n/r");
			decode_debug_message(&can_frm,&g_debug_byte_1,&g_debug_byte_2,&g_debug_byte_3,&g_debug_byte_4,&g_debug_byte_5,&g_debug_byte_6,&g_debug_byte_7,&g_debug_byte_8);
		}
		else if(can_frm.Identifier == SHUNT_DEFAULT_CAN_MSG_RESULT_I_ID) // SHUNT CURRENT
		{
			SHUNT_MSG_RESULT_t shunt_current_msg;
			uint8_t err;
			err=Shunt_DecodeCurrentMsg(&can_frm.Data[0],&shunt_current_msg,can_frm.DLC,can_frm.Identifier);
			if(err)
			{
				// Something went wrong
				UCOS_Printf("Shunt Error in Current message: %d", err);
			}


			OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);

			if(os_err == OS_ERR_NONE)
			{

				if( g_debug_byte_8 !=4 || g_debug_byte_8 !=3)
				{
					g_TS_current = shunt_current_msg.data; // IGNORE DATA IF DEBUG
				}
				OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
			}
			else
			{
				UCOS_Printf("Error CAN_RX : TS Block MUTEX error number %d", os_err);
			}






		}
		else if(can_frm.Identifier == SHUNT_DEFAULT_CAN_MSG_RESULT_U2_ID) // TS + fused
		{
			SHUNT_MSG_RESULT_t shunt_TS_plus_msg;
			uint8_t err;
			err=Shunt_DecodeVoltageMsg(&can_frm.Data[0],&shunt_TS_plus_msg,can_frm.DLC,can_frm.Identifier);
			if(err)
			{
				// Something went wrong
				UCOS_Printf("Shunt Error in TS+(U1) message: %d", err);
			}

			OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
				if(os_err == OS_ERR_NONE)
				{

					g_TS_voltage = shunt_TS_plus_msg.data;
					OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
				}
				else
				{
					UCOS_Printf("Error CAN_RX : TS Block MUTEX error number %d", os_err);
				}

		}
		else if(can_frm.Identifier == SHUNT_DEFAULT_CAN_MSG_RESULT_U1_ID) // BAT + fused
		{
			SHUNT_MSG_RESULT_t shunt_BAT_plus_msg;
			uint8_t err;
			err=Shunt_DecodeVoltageMsg(&can_frm.Data[0],&shunt_BAT_plus_msg,can_frm.DLC,can_frm.Identifier);
			if(err)
			{
				// Something went wrong
				UCOS_Printf("Shunt Error in BAT(U2) message: %d", err);
			}
			OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);


				if(os_err == OS_ERR_NONE)
				{

					//g_BAT_voltage = (g_debug_byte_1 << 24) | (g_debug_byte_2 << 16) | (g_debug_byte_3 << 8) | g_debug_byte_4;


					  g_BAT_voltage = shunt_BAT_plus_msg.data; // TODO INGNOREING TO SIMULATE BAT+ !!
					 // UCOS_Printf("Shunt bat modtaget: %d V",g_BAT_voltage);
					OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
				}
				else
				{
					UCOS_Printf("Error CAN_RX : TS Block MUTEX error number %d", os_err);
				}


		}
		else if(can_frm.Identifier == SHUNT_DEFAULT_CAN_MSG_RESULT_W_ID) // Power
		{
			SHUNT_MSG_RESULT_t shunt_power_msg;
			uint8_t err;
			err=Shunt_DecodeVoltageMsg(&can_frm.Data[0],&shunt_power_msg,can_frm.DLC,can_frm.Identifier);
			if(err)
			{
				// Something went wrong
				UCOS_Printf("Shunt Error in BAT(U2) message: %d", err);
			}

			OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
				if(os_err == OS_ERR_NONE)
				{

					g_TS_power = shunt_power_msg.data;
					OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
				}
				else
				{
					UCOS_Printf("Error CAN_RX : TS Block MUTEX error number %d", os_err);
				}

		}
		else if(can_frm.Identifier == SHUNT_DEFAULT_CAN_MSG_RESULT_AS_ID) // Current Counter
		{
			SHUNT_MSG_RESULT_t shunt_currect_counter_msg;
			uint8_t err;
			err=Shunt_DecodeVoltageMsg(&can_frm.Data[0],&shunt_currect_counter_msg,can_frm.DLC,can_frm.Identifier);
			if(err)
			{
				// Something went wrong
				UCOS_Printf("Shunt Error in BAT(U2) message: %d", err);
			}

			OSMutexPend(&g_mutex_TS_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);

				if(os_err == OS_ERR_NONE)
				{

					g_TS_coulomb_count = shunt_currect_counter_msg.data;
					OSMutexPost(&g_mutex_TS_block,OS_OPT_POST_NONE,&os_err);
				}
				else
				{
					UCOS_Printf("Error CAN_RX : TS Block MUTEX error number %d", os_err);
				}


		}
		pl_led3(!blink);

		// END OF Messages

			//printCanMessage(can_frm);



	}


}
void decode_command_message(CANFRM * frame,uint8_t *command, uint8_t* bank_count_set_by_car)
{

	*command = (frame->Data[0] & 7);
	*bank_count_set_by_car = ((frame->Data[0] & 0xE0) >>5);

}
void decode_charger_status_message(CANFRM * frame, uint8_t *charge_command, uint8_t *charger_status, uint8_t *charger_counter)
{

	*charge_command = (frame->Data[0] &3);
	*charger_status = (frame->Data[1] &3);
	*charger_counter = frame->Data[2];

}
void decode_debug_message(CANFRM * frame, uint8_t * debug_byte1,uint8_t * debug_byte2,uint8_t * debug_byte3,uint8_t * debug_byte4,uint8_t * debug_byte5,uint8_t * debug_byte6,uint8_t * debug_byte7,uint8_t * debug_byte8)
{
	*debug_byte1 = frame->Data[0];
	*debug_byte2 = frame->Data[1];
	*debug_byte3 = frame->Data[2];
	*debug_byte4 = frame->Data[3];
	*debug_byte5 = frame->Data[4];
	*debug_byte6 = frame->Data[5];
	*debug_byte7 = frame->Data[6];
	*debug_byte8 = frame->Data[7];

}

void printCanMessage(CANFRM frame){
	// Print a CAn frame to the Seriel port.

	UCOS_Printf("CAN Message Recived: ID: %x  Data: %x %x %x %x %x %x %x %x \r\n",
			frame.Identifier,
			frame.Data[7],
			frame.Data[6],
			frame.Data[5],
			frame.Data[4],
			frame.Data[3],
			frame.Data[2],
			frame.Data[1],
			frame.Data[0]
					   );


}


/*
 * 	 CANFRM can_frm;
	 CanBusIoCtl(ZC7xxx_CAN_BUS_0, CANBUS_SET_RX_TIMEOUT, 0u);   // Set Timeout to wait forever for new CAN Msg.
	 int temp;
reset_flag = 0;

	 while (DEF_ON)
	 {
	     CanBusRead( ZC7xxx_CAN_BUS_0,                   // Pend till New CAN msg is found on CAN BUS
	                 (void *)&can_frm,
	                 sizeof(CANFRM));
	     if (debug_bool){UCOS_Print("Received something on CAN \n");}

	     switch (can_frm.Identifier)
	     {
	     case 0x401: //Master Command Message
	    	 OSMutexPend(&Controlvariable_Mutex, 0, OS_OPT_PEND_BLOCKING, 0, &CAN1_RX_ERR);
   		  	 if(CAN1_RX_ERR!= OS_ERR_NONE)
   		  	 {
   		  		 UCOS_Print("CAN rx, controlvariable mutex error\n");
   		  	 }

   		  	 //if((can_frm.Data[0]&0b1111)==1 ||(can_frm.Data[0]&0b1111)==1<<1||(can_frm.Data[0]&0b1111)==1<<2||(can_frm.Data[0]&0b1111)==1<<3||(can_frm.Data[0]&0b1111)==1<<4)
   		  	 // {rdy_flags |= can_frm.Data[0];}

   		  	 cmd_flags = can_frm.Data[0] &0b11111;

   		  	 if(can_frm.Data[0] & (1 << 5))
   		  		 reset_flag = 1;

   		  	 connected_to_charger = can_frm.Data[0] & (1 << 6);

   		  	 charging_scaler = can_frm.Data[1];



   		     OSMutexPost(&Controlvariable_Mutex, OS_OPT_POST_NONE, &CAN1_RX_ERR);
   		  	 if(CAN1_RX_ERR!= OS_ERR_NONE)
   		  	 {
   		  		 UCOS_Print("CAN rx, controlvariable mutex error\n");
   		  	 }
	     	 break;
 */
