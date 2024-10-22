// TO-DO:
// Driver is for polled operation. Must implement interrupts for actual application.
// Watermarks are not implemented.
// No modes other than loopback are implemented.




#include "xparameters.h"
#include "xcanps.h"



// Defines
// -------------------------------------------------
// CAN Clock, as set in Vivado, is 23.8 (24) MHz
// Baud Rate Prescaler reduces the clock used for time quantums in CAN.
// The recommended minimum value of the prescaler is 2.
// This value is for a 1 Mbps baudrate assuming the CAN input clock frequency is 23.8 (24) MHz.
#define TEST_BRPR_BAUD_PRESCALER 2
// Resulting frequency is f_TQ = 23.8 MHz / (2 + 1) = 7.933 MHz.
// The time quantum is this t_TQ = 1 / 7.933 MHz = 0.126 µs
// These timing parameters are for a 1 Mbps baud rate assuming the CAN input clock frequency is 23.8 MHz.
// 77.77% sampling point.
#define TEST_BTR_SYNCJUMPWIDTH		3
#define TEST_BTR_FIRST_TIMESEGMENT	3
#define TEST_BTR_SECOND_TIMESEGMENT	2
// Resulting bit rate is BIT_RATE = 23.8 MHz / ((2 + 1) * (3 + 3 + 2)) = 0.99 Mbit/s

// Variables
// -------------------------------------------------
XCanPs CAN_PS[2];
XCanPs_Config *CAN_CFG[2];

// Functions
// -------------------------------------------------
// Initialization function
// Input: CAN Module ID
// Output: Failure/success check
// Function: Initializes the CAN hardware to 1 Mbit/s and runs checks as needed
int can_init(u16 ID);

// Send function
// Input: CAN Module ID, pointer to start of transmit buffer
// Output: Failure/success check
// Function: Sends the data stored within the transmit buffer
int can_send(u16 ID, u32 *frameptr);

// Receive function
// Input: CAN Module ID, pointer to start of receive buffer
// Output: Failure/success check
// Function: Puts received data into the receive buffer
int can_receive(u16 ID, u32 *frameptr);

// Enter loopback mode function
// Input: CAN Module ID
// Output: Failure/success check
// Function: Puts the CAN controller into loopback mode
void can_loopback_mode(u16 ID);

// Enter normal mode function
// Input: CAN Module ID
// Output: Failure/success check
// Function: Puts the CAN controller into normal mode
void can_normal_mode(u16 ID);

// TX FIFO Ready function
// Input: CAN Module ID
// Output: Failure/success check
// Function: Checks whether TX FIFO is ready or full
int can_txready(u16 ID);

// RX FIFO Ready function
// Input: CAN Module ID
// Output: Failure/success check
// Function: Checks whether RX FIFO is ready or empty
int can_rxready(u16 ID);

#endif /* MC_CAN_H */
