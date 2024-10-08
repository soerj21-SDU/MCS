/*
 * CAN_Tx_Task.c
 *
 *  Created on: Apr 1, 2020
 *      Author: soeren
 */

#include "CAN_Tx_Task.h"



// Internal functions

void send_frame(CANFRM * frm);
void Send_Status_Message();
void send_status();
void send_error(CANFRM * frm, uint16_t error_value);
uint8_t parse_status_byte1();
uint8_t convert_cell_voltage_to_uint8(uint16_t cell_voltage);
void send_cell_voltages(CANFRM *frame, uint8_t bank, uint8_t group);
void send_cell_temp(CANFRM *frame, uint8_t bank, uint8_t monitor_device);
void send_discharge_temp(CANFRM *frame, uint8_t bank, uint8_t monitor_device);
void send_charger_status(CANFRM *frame);

int8_t convert_cell_temp_to_int8(uint16_t temperature);

void CAN_Init()
{
    CPU_INT16S  can_err;
    CANMSG_PARA  *m;
#if (CANSIG_STATIC_CONFIG == 0u)
    CANSIG_PARA  *s;
#endif


    ZC7xxx_CAN_BSP_IntVectSet();                                // Assign ISR handlers for CAN Channels


    CanSigInit(0L);                                          /* Initialize CAN Signals.                              */
#if (CANSIG_STATIC_CONFIG == 0u)
    s = CanSig;
    while (s < &CanSig[S_MAX]) {                                /* Create CAN Signals                                   */
        can_err = CanSigCreate(s);
        if (can_err < 0) {
        	UCOS_Print("Error in CAN0 CAnnot create CAN signals...\n\r");
           while (1);                                           /* Failure Handling Here.                               */
        }
        s++;
    }
#endif
    CanMsgInit(0L);                                          /* Initialize CAN Messages.                             */
    m = (CANMSG_PARA *)CanMsg;
    while (m < &CanMsg[CANMSG_N]) {                          /* Create CAN Messages.                                 */
        can_err = CanMsgCreate(m);
        if (can_err < 0) {
        	UCOS_Print("Error in CAN0 Cannot create CAN messages...\n\r");
           while (1);                                           /* Failure Handling Here.                               */
        }
        m++;
    }


    CanBusInit(0L);                                             // Initialize uC/CAN Bus

                      // --------------------- CAN 0 ------------------------
    can_err = CanBusEnable((CANBUS_PARA *)&CanCfg0);            // Enable CAN0 Device acc. Configuration
    if (can_err != CAN_ERR_NONE)
        UCOS_Print("Error in CAN0 Bus Enable...\n\r");
}
OS_ERR create_CAN_TX_Task()
{
	OS_ERR err;

    OSTaskCreate(&CAN_TX_TCB,                      //  - TX Task.
                 "CAN RX Task",
				 CAN_TX_Task,
				 0,          				//argument for task. None for the moment
				 CAN_TX_TASK_PRIO,
				 &CAN_TxTaskStk[0],
				 CAN_TX_TASK_STK_SIZE/10,
				 CAN_TX_TASK_STK_SIZE,
				 CAN_TX_TASK_MSGQ_SIZE,
				 0,
				 DEF_NULL,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR), //stack checking and stack clearing options
				 &err);

    return err;

}

void CAN_TX_Task(void *arg)
{


	g_CAN_TX_Alive_Counter=0;
	OS_ERR err;
	g_ams_status_heartbeat=0;
	g_ams_charger_status_hearbeat =0;

	CANFRM status_frm;
	status_frm.Identifier = CAN_BASEADDR+CAN_MSG_STATUS_ID; // Normal 0x400
	status_frm.DLC        = 6u;

	CANFRM cell_voltage_frm;
	cell_voltage_frm.Identifier = CAN_BASEADDR+CAN_MSG_CELL_VOLTAGE_ID;
	cell_voltage_frm.DLC        = 8u;

	CANFRM cell_temp_frm;
	cell_temp_frm.Identifier = CAN_BASEADDR+CAN_MSG_CELL_TEMP_ID;
	cell_temp_frm.DLC        = 6u;

	CANFRM discharge_temp_frm;
	discharge_temp_frm.Identifier = CAN_BASEADDR+CAN_MSG_DISCHARGE_TEMP_ID;
	discharge_temp_frm.DLC        = 8u;


	CANFRM error_frm;
	error_frm.Identifier = CAN_BASEADDR+CAN_MSG_ERROR_ID;
	error_frm.DLC        = 6u;

	CANFRM charger_status_frm;
	charger_status_frm.Identifier = CAN_BASEADDR+CAN_MSG_CHARGE_STATUS;
	charger_status_frm.DLC        = 6u;


	//pl_led_init();
	bool led_blink=false;
	OS_ERR os_err;
	while(1)
	{
		//g_CAN_TX_Alive_Counter++;



		OSMutexPend(&g_mutex_cell_voltages,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error CAN TX: Cell voltage MUTEX error = %d", os_err);
		}
		OSMutexPend(&g_mutex_status_block,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error CAN TX: Status block MUTEX error = %d", os_err);
		}
		OSMutexPend(&g_mutex_cell_temps,0,OS_OPT_PEND_BLOCKING,0,&os_err);
		if(os_err != OS_ERR_NONE)
		{
			UCOS_Printf("Error CAN TX: Status block MUTEX error = %d", os_err);
		}

		/*
		for(uint8_t i =0; i<NUMBER_OF_CELLS_PR_BANK; i++)
		{
			uint16_t temp_volt =g_cell_voltages[0][i];
			UCOS_Printf(" COM Bank:0  Cell: %d, Voltage: %d \r\n",i ,temp_volt);
		}
		*/

		if(g_charger_connected)
		{
			send_charger_status(&charger_status_frm);
		}
		else{
			send_status(&status_frm);
		}

		// SEND VOLTAGE
		for(uint8_t bank=1;bank <=5;bank++)
		{
			for(uint8_t group=0; group<4; group++)
			{
				send_cell_voltages(&cell_voltage_frm,bank,group);
			}
		}

		// SEND TEMP
		for(uint8_t bank=1;bank <=5;bank++)
		{
			for(uint8_t temp_device=0; temp_device<DEVICES_PR_BANK ; temp_device++)
			{
				send_cell_temp(&cell_temp_frm,bank,temp_device);
			}
		}
		// SEND Discharge temp
		for(uint8_t bank=1;bank <=5;bank++)
		{
			for(uint8_t temp_device=0; temp_device<DEVICES_PR_BANK ; temp_device++)
			{
				send_discharge_temp(&discharge_temp_frm,bank,temp_device);
			}
		}


		// Send Error event if any.
		uint16_t error_length;
		uint8_t *error = OSTaskQPend(0,OS_OPT_PEND_NON_BLOCKING,&error_length,NULL,&os_err); // NOT BLOCKING

		if(os_err == OS_ERR_NONE) // A message has been recived
		{

			//UCOS_Printf("TX error code = %d \n\r ", *error);
			send_error(&error_frm,*error);

		}

		// Post Mutex

		led_blink = !led_blink;
		pl_led1(led_blink);
		OSMutexPost(&g_mutex_cell_voltages,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_status_block,OS_OPT_POST_NONE,&os_err);
		OSMutexPost(&g_mutex_cell_temps,OS_OPT_POST_NONE,&os_err);


		OSTimeDlyHMSM(0,0,0,50,OS_OPT_TIME_HMSM_STRICT,&err);


	}
}
void send_frame(CANFRM * frm)
{
	CanBusWrite(ZC7xxx_CAN_BUS_0,(void*)frm,sizeof(CANFRM)); // Send Frame.
}

/*
 * input: bank = 1->5
 * input: group = 0-> 4.
 */
void send_cell_voltages(CANFRM *frame, uint8_t bank, uint8_t group)
{
	if(bank>5){
		// Error
		UCOS_Printf("Error in CANTX send voltages: Cannot bank count out of scope");
		return;
	}

	if(bank<=5 && group >= 0 && group <4)
	{
		uint8_t control_byte = ((bank & 7) <<5) | (group & 7);

		frame->Data[0] = control_byte;

		for( uint8_t i =1; i<=7 ; i++)
		{

			frame->Data[i]=convert_cell_voltage_to_uint8(g_cell_voltages[bank-1][(i-1)+(group*7)]);
			//UCOS_Printf("Bank : %d   cell nr: %d  , Raw: %d, Converted: %d  \r\n ",bank,((i-1)+(group*7)),g_cell_voltages[bank-1][(i-1)+(group*7)],frame->Data[i]);
		}

		send_frame(frame);
	}


}


uint8_t parse_status_byte1()
{
	 uint8_t ams_status =(Control_states & 31);

	 uint8_t number_of_banks= ((g_number_of_banks & 7)<<5);

	 return (number_of_banks|ams_status);


}
uint8_t parse_status_byte2()
{


	uint8_t relays= (AIRM_AUX() << 7) | (AIRP_AUX() << 6) |(Precharge_AUX() << 5);
	uint8_t errors= (IMD_Latched() << 1) | (AMS_Latched()<<0);
	uint8_t warninigs = (g_warining_temprature <<2) | (g_warining_voltage_near_limit <<3);

	 return (relays | errors| warninigs);

	return 0;

}

void send_status(CANFRM *frame)
{

	g_ams_status_heartbeat++;
	uint8_t byte1 = parse_status_byte1();
	uint8_t byte2 = parse_status_byte2();

	frame->Data[0]=byte1;
	frame->Data[1]=byte2;
	frame->Data[2]= convert_cell_voltage_to_uint8(g_lowest_cell_voltage);
	//UCOS_Printf("\r\n TX: Cell voltage : %d  con: %d \r\n",g_lowest_cell_voltage,convert_cell_voltage_to_uint8(g_lowest_cell_voltage));
	frame->Data[3]=convert_cell_temp_to_int8(g_higest_cell_temperature);
	frame->Data[4]=g_SOC;
	frame->Data[5]=g_ams_status_heartbeat;
	send_frame(frame);
	// parse globals to according to protocol.
	// Insert passed two bytes into frm
	// Send byte

}
void send_charger_status(CANFRM *frame)
{

	g_ams_charger_status_hearbeat++;
	uint8_t byte1 = parse_status_byte1();
	uint8_t byte2 = parse_status_byte2();

	frame->Data[0]=byte1;
	frame->Data[1]=byte2;
	frame->Data[2]=g_SOC;
	frame->Data[3]=(uint8_t) g_charge_current;
	frame->Data[4]=g_charge_control;
	frame->Data[5]=g_ams_charger_status_hearbeat;

	send_frame(frame);
	//UCOS_Printf("heartbeat %d", g_ams_charger_status_hearbeat);
	// parse globals to according to protocol.
	// Insert passed two bytes into frm
	// Send byte

}

void send_error(CANFRM * frm, uint16_t error_value)
{
	frm->Data[0] = (uint8_t) error_value;

	//UCOS_Printf("ErrROR 8bit  = %d ", frm->Data[0]);
	send_frame(frm);
}



/*
 *  This function is a test of the Signal and message layer. It currently does not work
 */

void Send_Status_Message(){
    CANFRM      frm;
    CPU_INT16S  msg;
    CPU_INT08U  busId;

    busId = ZC7xxx_CAN_BUS_0;

    msg = CanMsgOpen(busId,0x122u,0);

    if(msg>=0) // The message could be found
    {
    	CanMsgRead(msg,&frm,sizeof(CANFRM)); // Create a canFrame based on the message and the linked signals.

    	CanBusWrite(busId,(void*)&frm,sizeof(CANFRM)); // Send Frame.

    }
    else
    {
    	if(msg == CAN_ERR_NULLMSG)
    	{
    		UCOS_Printf("\r\nHEEELP MSG ERROR \r\n");
    	}
    	else
    	{
    		UCOS_Printf("\r\nHEEELP \r\n");
    	}

    }


}
uint8_t convert_cell_voltage_to_uint8(uint16_t cell_voltage){
	// Parsing the uint16_t to a uin8t_t format to send it over CAN.
	// input resolution, LSB = 100uV

	// output resolution, LSB =20mV, Max value = 5.1V(dec 255).
	if(cell_voltage>51000) // 5.1V
	{
		cell_voltage = 51000;
	}

	uint16_t temp = cell_voltage/200;

	return (uint8_t) temp;


}

/*
 *  Send temprature can message.
 *  One slave board has to devices with each have 5 tempratures
 *  Therefore one message contrains :
 *  1 byte: Bank/group ID
 *  2 byte : temp 0
 *  3 byte : temp 1
 *  4 byte : temp 2
 *  5 byte : temp 3
 *  6 byte : temp 4
 *
 *  Each board has therfore 2 groups, one for each device
 *
* 	input: bank = [1->5]
* 	input: monitor_device = [0,1]

 *
 */
void send_cell_temp(CANFRM *frame, uint8_t bank, uint8_t monitor_device)
{

	if(bank>5)
	{
		// Error
		UCOS_Printf("Error in CANTX send temp: bank count out of scope");
		return;
	}
	if(monitor_device <0  || monitor_device>1)
	{
		UCOS_Printf("Error in CANTX send temp: Monitor devices out of scope");
		return;
	}


	uint8_t control_byte = ((bank & 7) <<5) | (monitor_device & 7);

	frame->Data[0] = control_byte;

	for( uint8_t i=1; i<= NUMBER_OF_TEMPS_PER_DEVICE ; i++)
	{
		frame->Data[i] = convert_cell_temp_to_int8(g_cell_temps[bank-1][(i-1)+monitor_device*5]);
		//UCOS_Printf("TEMP Bank : %d   monitor device : %d  , selected temp: %d   data : %d \r\n",bank-1,monitor_device,(i-1)+monitor_device*5,frame->Data[i]);
		//frame->Data[i]=convert_cell_voltage_to_uint8(g_cell_voltages[bank-1][(i-1)+(group*7)]);
		//UCOS_Printf("Bank : %d   cell nr: %d  , Raw: %d, Converted: %d  \r\n ",bank,((i-1)+(group*7)),g_cell_voltages[bank-1][(i-1)+(group*7)],frame->Data[i]);
	}

	send_frame(frame);


}

/*
 *  Send discharge temp CAN message.
 *  One slave board has to devices with each have 5 tempratures
 *  Therefore one message contrains :
 *  1 byte: Bank/group ID
 *  2 byte : discharge temp 0
 *  3 byte : discharge temp 1
 *  4 byte : discharge temp 2
 *  5 byte : discharge temp 3
 *  6 byte : discharge temp 4
 *  7 byte : discharge temp 5
 *  8 byte : discharge temp 6
 *
 *  Each board has therfore 2 groups, one for each device
 *
* 	input: bank = [1->5]
* 	input: monitor_device = [0,1]

 *
 */

void send_discharge_temp(CANFRM *frame, uint8_t bank, uint8_t monitor_device)
{
	if(bank>5)
	{
		// Error
		UCOS_Printf("Error in CANTX send discharge temp: bank count out of scope");
		return;
	}
	if(monitor_device <0  || monitor_device>1)
	{
		UCOS_Printf("Error in CANTX send discharge temp: Monitor devices out of scope");
		return;
	}


	uint8_t control_byte = ((bank & 7) <<5) | (monitor_device & 7);

	frame->Data[0] = control_byte;

	for( uint8_t i=1; i<= DISCHARGE_TEMP_PER_DEVICE ; i++)
	{
		//UCOS_Printf("Discharge Bank %d.. init value : %d ",bank-1,g_cell_discharge_temps[bank-1][(i-1)+monitor_device*7]);
		frame->Data[i] = convert_cell_temp_to_int8(g_cell_discharge_temps[bank-1][(i-1)+monitor_device*7]);
		//UCOS_Printf("converted value %d \r\n",frame->Data[i]);
		//UCOS_Printf("Dischage TEMP Bank : %d   monitor device : %d  , selected temp: %d   data : %d \r\n",bank-1,monitor_device,(i-1)+monitor_device*7,frame->Data[i]);
		//frame->Data[i]=convert_cell_voltage_to_uint8(g_cell_voltages[bank-1][(i-1)+(group*7)]);
		//UCOS_Printf("Bank : %d   cell nr: %d  , Raw: %d, Converted: %d  \r\n ",bank,((i-1)+(group*7)),g_cell_voltages[bank-1][(i-1)+(group*7)],frame->Data[i]);
	}

	send_frame(frame);

}

int8_t convert_cell_temp_to_int8(uint16_t temperature)
{
	// inuput uint 0.1C
	// output unit 1C

	int8_t result = temperature/10;

	return result;



}




