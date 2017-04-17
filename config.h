#ifndef _CONFIG_H_
#define _CONFIG_H_

#include "definitions.h"

#define L_LED_GPIO_ODR GPIOE_ODR.B12
#define R_LED_GPIO_ODR GPIOE_ODR.B15

#define LEFT_LED_PORT      PORT_E
#define LEFT_LED_PIN       BIT_12

#define RIGHT_LED_PORT     PORT_E
#define RIGHT_LED_PIN      BIT_15

#define LEFT_BUTTON_PORT   PORT_E
#define LEFT_BUTTON_PIN    BIT_0

#define RIGHT_BUTTON_PORT  PORT_A
#define RIGHT_BUTTON_PIN   BIT_10

// LCD
#define LCD_RS_CONF  GPIOC_ODR.B4
#define LCD_EN_CONF  GPIOC_ODR.B13
#define LCD_D4_CONF  GPIOC_ODR.B3
#define LCD_D5_CONF  GPIOC_ODR.B2
#define LCD_D6_CONF  GPIOC_ODR.B1
#define LCD_D7_CONF  GPIOC_ODR.B0

#define LCD_D4_PORT        PORT_C
#define LCD_D5_PORT        PORT_C
#define LCD_D6_PORT        PORT_C
#define LCD_D7_PORT        PORT_C
#define LCD_RS_PORT        PORT_C
#define LCD_EN_PORT        PORT_C


#define LCD_D4_PIN         BIT_3
#define LCD_D5_PIN         BIT_2
#define LCD_D6_PIN         BIT_1
#define LCD_D7_PIN         BIT_0
#define LCD_RS_PIN         BIT_4
#define LCD_EN_PIN         BIT_13

#define UART4_TX_PORT      PORT_A
#define UART4_TX_PIN       BIT_0
#define UART4_RX_PORT      PORT_A
#define UART4_RX_PIN       BIT_1




//VALUE FOR TIMES BELOW ARE INVALIT
//100 = 2 second

#define BLANCO_TIME        7.5     // 7xDOT_TIME

#define CONFIRM_TIME       25    // 5s

#define CONF_TIME_1        2.5    // 0.5s
#define CONF_TIME_2        5    // 1s
#define CONF_TIME_3        7.5    // 1.5s
#define CONF_TIME_4       10    // 2s


#endif