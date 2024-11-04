#include "xsysmon.h"
#include "xparameters.h"
#include "xil_printf.h"

#define SYSMON_BASEADDR XPAR_XSYSMON_0_BASEADDR
#define ADC_CHANNEL XSM_CH_AUX_MIN + 14 // AD14 corresponds to VAUXP[14]

int main(void) {
    XSysMon SysMonInst;
    XSysMon_Config *SysMonConfig;
    int Status;
    u16 RawData;
    float Voltage;

    // Initialize the SysMon driver
    SysMonConfig = XSysMon_LookupConfig(SYSMON_BASEADDR);
    if (SysMonConfig == NULL) {
        xil_printf("Error: SysMon configuration not found.\n");
        return XST_FAILURE;
    }

    Status = XSysMon_CfgInitialize(&SysMonInst, SysMonConfig, SysMonConfig->BaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("Error: SysMon initialization failed.\n");
        return XST_FAILURE;
    }

    // Configure the ADC channel
    XSysMon_SetSeqChEnables(&SysMonInst, XSM_SEQ_CH_AUX14);
    XSysMon_SetSeqAcqTime(&SysMonInst, 0b0000);
    XSysMon_SetSeqAvgEnables(&SysMonInst, XSM_AVG_16_SAMPLES);
    XSysMon_SetSequencerMode(&SysMonInst, XSM_SEQ_MODE_CONTINPASS);


int counter=0;
int dummy = 0; 
    do {
        // Read the ADC value
        RawData = XSysMon_GetAdcData(&SysMonInst, ADC_CHANNEL);
        Voltage = XSysMon_RawToVoltage(RawData);

        // Print the results
        printf("ADC Value: %d\n\r", RawData);
        printf("Voltage: %0.3f V\n", Voltage);
        for (int delay = 10000000; delay > 1; delay--) {
            dummy = delay;         
        }
        counter++;
    }while (counter < 11);

    return 0;
}
