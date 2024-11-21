/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"

#include "GPIO.h"

#define DELAY_2_SECONDS 2000UL

/* Flag to indicate LED should be turned on */
static volatile BaseType_t xLEDFlag = pdFALSE;

/* Timer callback function to set the LED flag */
void vTimerCallback(TimerHandle_t xTimer)
{
    xLEDFlag = pdTRUE;
}

/* Task to check the flag and control the LED */
static void prvLEDTask(void *pvParameters)
{
    for (;;)
    {
        if (xLEDFlag == pdTRUE)
        {
            /* Control the LED */
            xil_printf("LED is now ON\r\n");
            xLEDFlag = pdFALSE;  // Reset the flag if needed
        }
        vTaskDelay(pdMS_TO_TICKS(100));  // Small delay to prevent task from hogging the CPU
    }
}

int main(void)
{
    TimerHandle_t xTimer;

    xil_printf("Starting LED control task\r\n");

    /* Create the LED task */
    xTaskCreate(prvLEDTask, "LEDTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);

    /* Create the timer */
    xTimer = xTimerCreate("LEDTimer", pdMS_TO_TICKS(DELAY_2_SECONDS), pdFALSE, (void *)0, vTimerCallback);
    configASSERT(xTimer);

    /* Start the timer */
    xTimerStart(xTimer, 0);

    /* Start the scheduler */
    vTaskStartScheduler();

    for (;;);
}