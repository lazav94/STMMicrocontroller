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

#define PUSH_PULL             0x0
#define OPEN_DRAIN            0x1

#define LOW                   0x0
#define MEDIUM                0x1
#define HIGH                  0x2
#define VERY_HIGH             0x3

#define NO_PULL_PUSH          0x0
#define PULL_UP               0x1
#define PULL_DOWN             0x2
#define RESERVED              0x3
  /*
#define AF_UART               0xXX
#define UART_4                0xXX

        */


#endif