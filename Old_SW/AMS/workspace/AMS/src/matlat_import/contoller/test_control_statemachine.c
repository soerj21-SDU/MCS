/*
 * control_statemachine_unit_test.c
 *
 *  Created on: Mar 26, 2020
 *      Author: soeren
 */
#include "../../Unit_testing/unity.h"
#include "control_statemachine.h"
#include "../../global_def.h"


 RT_MODEL DUT; // Device under test.
 ExtU input;
 ExtY output;

void setUp(void){
    Controller_statemachine_initialize(&DUT); // Reset DUT to init state.
}

void tearDown(void){}

void initModel(){

}

void _resetInputs(ExtU *in){
    _resetAUX(in);
    in->V_TS=0;
    in->V_BAT=0;
    in->SC_END=0;
    in->AMS_lached=0;
    in->TS_Current = 0;
    in->command = NON;


}

void _resetAUX(ExtU *in)
{
    in->AIR_m_AUX =false;
    in->AIR_p_AUX = false;
    in->PRE_AUX = false;
}

void test_controller_should_ResetALLOUTPUTVALUES(void){
    TEST_ASSERT(1);


}

void controller_Relay_output_reset_to_zero_at_starup(void)
{


    _resetInputs(&input);

    Controller_statemachine_step(&DUT,&input,&output);
    //Controller_statemachine_initialize(&DUT);
    //Controller_statemachine_step(&DUT,&input,&output);

    uint8_t counter;
    for(uint8_t hej =0; hej<10; hej++)
    {
    	counter++;


    }
    xil_printf("counter %d \r\n", counter);
    /*
    for(uint8_t i =0; i<2;i++ )
    {

        Controller_statemachine_step(&DUT,&input,&output);
    }
    */

    /*
    TEST_ASSERT_FALSE(output.AIR_m_CTRL);
    TEST_ASSERT_FALSE(output.AIR_m_CTRL);
    TEST_ASSERT_FALSE(output.Pre_CTRL);
    xil_printf("counter2 %d \r\n", counter);
    */

    TEST_ASSERT_EQUAL_UINT8_MESSAGE(ControlState_T_Init_state,Control_states,"IN Wrong state");

}


int  Run_controller_unit_test(){
    UNITY_BEGIN();
    RUN_TEST(controller_Relay_output_reset_to_zero_at_starup);
    return UNITY_END();
}
