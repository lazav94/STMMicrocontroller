//NA 32MHz -> Delay_ms(3000) = 6s
// fclk = 16MHz

#include "definitions.h"
#include "led.h"
#include "uart.h"
#include "button.h"
#include "lcd.h"
#include "timers.h"

// LEDs
extern volatile sbit LED_1;
extern volatile sbit LED_2;

// Buttons
volatile sbit BUTTON_1 at GPIOE_IDR.B0;
volatile sbit BUTTON_2 at GPIOA_IDR.B10;

// LCD
volatile sbit LCD_RS at GPIOC_ODR.B4;
volatile sbit LCD_EN at GPIOC_ODR.B13;

volatile sbit LCD_D4 at GPIOC_ODR.B3;
volatile sbit LCD_D5 at GPIOC_ODR.B2;
volatile sbit LCD_D6 at GPIOC_ODR.B1;
volatile sbit LCD_D7 at GPIOC_ODR.B0;



// TEST VALUE - DELETE AFFTER TESTING
//volatile char letter[6] = ".-.--";
//volatile char letters[100][6] = {".-.--", "-.-.." , ".-.--", "-.-.."};

volatile char letter[6] ;
volatile char letters[100][6];
volatile unsigned letter_cnt;
volatile unsigned int letters_cnt;
volatile char word[50] ;

// Time variables
volatile unsigned currentTime = 0;
volatile unsigned riseTimeB1 = 0;
volatile unsigned fallTimeB1 = 0;
volatile unsigned riseTimeB2 = 0;
volatile unsigned fallTimeB2 = 0;

volatile char time[3];

volatile char uart_rd;
volatile char uart_tr;


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


 void init_all(){
 /*
    This clock is equal to the APB2 clock. The digital interface clock can be
    enabled/disabled individually for each ADC through the RCC APB2 peripheral clock
    enable register (RCC_APB2ENR)
 */
    RCC_APB2ENR |= (1 << 14);             //  System configuration controller clock enable
    init_Lcd();
    init_Timer2();
    init_Buttons();
    init_LEDs();
    init_UART();
}

void welcome(){
    LCD_CLEAR_SCREEN();
    LCD_CURSOR(0,0);
    LCD_CURSOR_ONN();
    /*
    Delay_ms(10);
    LCD_PRINT_STRING("Start");
    Delay_ms(10);
    */
    LCD_CLEAR_SCREEN();
}

void doSomething(){
    while(1);
}

void main(){
    init_all();                           // Initalize LCD, LEDs, Buttons, UART, Timer...
    Delay_ms(100);                        // Delay for stabilization initialization
    welcome();                            // Welcome screen (LCD print & LEDs blik...)
    doSomething();                        // Infinity loop (dummy loop)

}

// Interrupts

// Interrupt for Button PE0
void Button1_Interrupt() iv IVT_INT_EXTI0 {
     Delay_ms(10);

     if( EXTI_FTSR & (1UL)){         // is Button PE0 pressed
         riseTimeB1 = currentTime;
         EXTI_FTSR &= ~(1UL);
         EXTI_RTSR |= 1 ;
     }
     else if ( EXTI_RTSR & (1UL)){    // is Button PE0 realesed
         if(letter_cnt == 0) LCD_CLEAR_SCREEN();
         fallTimeB1 = currentTime;
         EXTI_RTSR &= ~(1UL);
         EXTI_FTSR |= 1 ;

         if(fallTimeB1 - riseTimeB1 < DASH_TIME)   // DOT
             fnc(DOT);
         else                                  // DASH
             fnc(DASH);
     } else{
         LCD_PRINT_STRING("Button1 Error");
     }

    EXTI_PR  = 0x01;                             // clear interraput    -- Pending bit
    EXTI_IMR |= 1;
}

// Interrupt for Button PA10
void Button2_Interrupt() iv IVT_INT_EXTI15_10 {
    Delay_ms(10);

    if( EXTI_FTSR & (1UL << 10)){         // is Button PA10 pressed
         if(letter_cnt == 0) LCD_CLEAR_SCREEN();
         riseTimeB2 = currentTime;
         EXTI_FTSR &= ~(1UL << 10);
         EXTI_RTSR |= (1 << 10);
     }else if ( EXTI_RTSR & (1UL << 10)){        // is Button PA10 realesed

         fallTimeB2 = currentTime;
         EXTI_RTSR &= ~(1UL << 10);
         EXTI_FTSR |= (1  << 10);

         if(fallTimeB2 - riseTimeB2 < RESET_TIME){   // DOT
             translate();
         }else {                               // DASH
             LCD_CLEAR_SCREEN();
         }

     }else
         LCD_PRINT_STRING("Button2 Error");

    EXTI_PR = (0x01 << 10);                      // clear interraput
    EXTI_IMR |= (1 << 10);
}

// Interrupt for UART 4 (PA0 and PA1)
void UART_Interrupt() iv IVT_INT_UART4  {

    if(UART4_SR & 0x20){
         uart_rd = ((char)(UART4_DR & 0x01FF));
         LCD_CLEAR_SCREEN();
         LCD_PRINT_CHAR(uart_rd);
         LCD_PRINT_STRING(" -> ");
         convert(uart_rd);
         LCD_PRINT_STRING(letter);
    }
    else if( UART4_SR & 0x80){
        UART4_CR1 &= ~(1UL << 7);         // disable TXEIE bit
        UART4_DR = (uart_tr & 0x01FF);
    }

    UART4_CR1 |= (1UL << 13);             // Enable UART  (when we write UART4_DR , we reset this bit , so we must enable uart again!!!!!!

}

// Interrupt for Timer 2
void Timer2_Interrupt() iv IVT_INT_TIM2 {
    if(TIM2_SR){
        currentTime++;
        TIM2_SR = 0x00;
    }else{
        LCD_PRINT_STRING("TIMER2 Error");
    }
}