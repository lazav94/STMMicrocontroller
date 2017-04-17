#ifndef _DEFINITIONS_H_
#define _DEFINITIONS_H_


#define A 10
#define B 11
#define C 12
#define D 13
#define E 14
#define F 15
#define G 16
#define H 17
#define I 18
#define J 19
#define K 20
#define L 21
#define M 22
#define N 23
#define O 24
#define P 25
#define Q 26
#define R 27
#define S 28
#define T 29
#define U 30
#define V 31
#define W 32
#define X 33
#define Y 34
#define Z 35

#define MODER   0
#define OTYPER  1
#define OSPEEDR 2
#define PUPDR   3
#define AFRL    4
#define AFRH    5

#define BRR     0
#define CR1     1
#define CR2     2
#define CR3     3

#define  WORD_8B 0UL
#define  WORD_9B 1UL
#define  WORD_LENGTH 12

#define PARITY_DISABLE 0UL
#define PARITY_ENABLE  1UL
#define PARITY         10

#define UART4_ENABLE   1UL
#define UART4_DISABLE  0UL
#define UART4_ED       13UL

#define UART_RECEIVE   2UL
#define UART_RX_ON     1UL
#define UART_RX_OFF    0UL

#define UART_TRANSMIT  3UL
#define UART_TX_ON     1UL
#define UART_TX_OFF    0UL

#define UART_RX_INTERRUPT     5UL
#define UART_RX_INTERRUPT_ON  1UL
#define UART_RX_INTERRUPT_OFF 0UL

#define UART_TX_INTERRUPT     7UL
#define UART_TX_INTERRUPT_ON  1UL
#define UART_TX_INTERRUPT_OFF 0UL


#define PORT_A  0
#define PORT_B  1
#define PORT_C  2
#define PORT_D  3
#define PORT_E  4

#define BIT_0   0
#define BIT_1   1
#define BIT_2   2
#define BIT_3   3
#define BIT_4   4
#define BIT_5   5
#define BIT_6   6
#define BIT_7   7
#define BIT_8   8
#define BIT_9   9
#define BIT_10  10
#define BIT_11  11
#define BIT_12  12
#define BIT_13  13
#define BIT_14  14
#define BIT_15  15



/****************************************
 *  MODER - MODE Register               *
 *   00 - Input(reset state)            *
 *   01 - General purpose output mode   *
 *   10 - Alternative function mode     *
 *   11 - Analog mode                   *
 *                                      *
 *  OTYPER - Output TYPE Register       *
 *   0 - Ouptu push-pull (reset state)  *
 *   1 - Output open-drain              *
 *  OSPEEDR - Output SPEED Register     ************************************************************************
 *   00 - Low speed                     *   [x0 2MHZ low speed, 01 10Mhz Medium speed, 11 50 Mhz  Hihg speed]  *
 *   01 - Medium speed                  ************************************************************************
 *   10 - High speed                    *
 *   11 - Very high speed               *
 *                                      *
 *  PUPDR - Pull-Up/Pull-Down           *
 *   00 - No pull-up, pull-down         *
 *   01 - Pull-up                       *
 *   10 - Pull-down                     *
 *   11 - Reserved                      *
 *                                      *
 *  IDR - Input Data Register           *
 *  ODR - Output Data Register          *
*****************************************/

#define INPUT                 0UL
#define OUTPUT                1UL
#define ALTERNATIVE_FUNCTION  2UL
#define ANALOG_MODE           3UL

#define PUSH_PULL             0UL
#define OPEN_DRAIN            1UL

#define LOW                   0UL
#define MEDIUM                1UL
#define HIGH                  2UL
#define VERY_HIGH             3UL

#define NO_PULL_PUSH          0UL
#define PULL_UP               1UL
#define PULL_DOWN             2UL
#define RESERVED              3UL


#define ALT_FUNC_UART         8UL

//New


  /*
#define AF_UART               0xXX
#define UART_4                0xXX

        */


#endif