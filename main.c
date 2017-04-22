#include "definitions.h"
#include "led.h"
#include "uart.h"
#include "button.h"
#include "lcd.h"
#include "timers.h"  

// LEDs
volatile sbit LED1 at L_LED_GPIO_ODR;
volatile sbit LED2 at R_LED_GPIO_ODR;

// LCD
volatile sbit LCD_RS at LCD_RS_CONF;
volatile sbit LCD_EN at LCD_EN_CONF;

volatile sbit LCD_D4 at LCD_D4_CONF;
volatile sbit LCD_D5 at LCD_D5_CONF;
volatile sbit LCD_D6 at LCD_D6_CONF;
volatile sbit LCD_D7 at LCD_D7_CONF;

// Global variables
volatile char letter[6] ;
volatile char letters[100][6];
volatile unsigned letter_cnt;
volatile unsigned int letters_cnt;
volatile char word[50] ;

// Time variables
volatile unsigned currentTime = 0;
volatile unsigned confirmTime = 0;
volatile unsigned riseTimeB1 = 0;
volatile unsigned fallTimeB1 = 0;
volatile unsigned riseTimeB2 = 0;
volatile unsigned fallTimeB2 = 0;

volatile int canTranslate = 0;

volatile char time[3];

volatile char uart_rd;
volatile char uart_tr;

volatile unsigned dashTime = HALF_SECOND_DASH;
volatile unsigned dotTime  = HALF_SECOND_DOT;
volatile unsigned spaceTime = 7 * HALF_SECOND_DOT;


// Not used (just for testing)
/*
void sleep_init(){
     SCB_SCR &= ~(1U << 2); // sleep
     SCB_SCR |= (1U << 4);  //Enabled events and all interrupts, including disabled interrupts, can wakeup the processor.

     asm  WFI;         // wait for interrupt   .
}   
*/

 void init_all(){
 /*
    This clock is equal to the APB2 clock. The digital interface clock can be
    enabled/disabled individually for each ADC through the RCC APB2 peripheral clock
    enable register (RCC_APB2ENR)
 */
    RCC_APB2ENR |= (1 << 14);             //  System configuration controller clock enable  

    init_LEDs();
    init_Buttons();
    init_UART();
    init_Lcd();
    init_Timer2();

}



void doSomething(){
    while(1) {
        asm WFI; // sleep until interrupt
    }
}



void main(){

    init_all();                           // Initalize LCD, LEDs, Buttons, UART, Timer...
    Delay_ms(10);                         // Delay for stabilization initialization
    doSomething();                        // Infinite loop (dummy loop)

}

void ChangeDashTime(){
        LCD_CURSOR(1,9);
        LCD_PRINT_STRING("SPEED:");
        switch(dashTime){
            case QUAD_SECOND_DASH:
                dotTime = HALF_SECOND_DOT;
                dashTime = HALF_SECOND_DASH;
                LCD_PRINT_CHAR('1');
                break;
            case HALF_SECOND_DASH:
                dotTime = ONE_SECOND_DOT;
                dashTime = ONE_SECOND_DASH;
                LCD_PRINT_CHAR('2');
                break;
            case ONE_SECOND_DASH:
                dotTime = TWO_SECOND_DOT;
                dashTime = TWO_SECOND_DASH;
                LCD_PRINT_CHAR('3');
                break;
            case TWO_SECOND_DASH:
                dotTime = QUAD_SECOND_DOT;
                dashTime = QUAD_SECOND_DASH;
                LCD_PRINT_CHAR('4');
                break;
        }
        spaceTime = 9*dotTime;  // 7x is in theory , but for testing we set on 9
        LCD_CURSOR(0,0);
}

// Interrupts

// Interrupt for Button PE0
void Button1_Interrupt() iv IVT_INT_EXTI0 {

     if( EXTI_FTSR & (1UL << LEFT_BUTTON_PIN)){         // is Button PE0 pressed
         LED1 = 1;
         riseTimeB1 = currentTime;
         EXTI_FTSR &= ~(1UL << LEFT_BUTTON_PIN);
         EXTI_RTSR |=   1UL << LEFT_BUTTON_PIN;
     }
     else if ( EXTI_RTSR & (1UL << LEFT_BUTTON_PIN)){    // is Button PE0 realesed
         LED1 = 0;
         if(letter_cnt == 0) LCD_CLEAR_SCREEN();
         fallTimeB1 = currentTime;
         EXTI_RTSR &= ~(1UL << LEFT_BUTTON_PIN);
         EXTI_FTSR |=   1UL << LEFT_BUTTON_PIN;
         
         canTranslate = 1;
         fnc(((fallTimeB1 - riseTimeB1 < dashTime) ? DOT : DASH));
     /* if(fallTimeB1 - riseTimeB1 < dashTime) fnc(DOT); else fnc(DASH); */
         spaceTime = 7 * dotTime;

     }

    EXTI_PR  = 0x01;                             // clear interraput    -- Pending bit
    EXTI_IMR |= 1;
}

// Interrupt for Button PA10
void Button2_Interrupt() iv IVT_INT_EXTI15_10 {

    if( EXTI_FTSR & (1UL << RIGHT_BUTTON_PIN)){         // is Button PA10 pressed
         if(letter_cnt == 0) LCD_CLEAR_SCREEN();
         riseTimeB2 = currentTime;
         EXTI_FTSR &= ~(1UL << RIGHT_BUTTON_PIN);
         EXTI_RTSR |= (1UL << RIGHT_BUTTON_PIN);
     }else if ( EXTI_RTSR & (1UL << RIGHT_BUTTON_PIN)){        // is Button PA10 realesed
         fallTimeB2 = currentTime;
         EXTI_RTSR &= ~(1UL << RIGHT_BUTTON_PIN);
         EXTI_FTSR |= (1  << RIGHT_BUTTON_PIN);
         
         if(fallTimeB2 - riseTimeB2 < RESET_TIME){   // DOT
            ChangeDashTime();
         }else {                               // DASH
             LCD_CLEAR_SCREEN();
             LED1 = LED2 = 0;
             
         }

     }

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
         LED_string_translate(letter);

         EXTI_PR  |= 1UL << UART4_RX_PIN;
         EXTI_IMR |= 1UL << UART4_RX_PIN;
    }
    else if( UART4_SR & 0x80){
        UART4_CR1 &= ~(1UL << UART_TX_INTERRUPT);         // disable TXEIE bit
        UART4_DR = (uart_tr & 0x01FF);
        EXTI_PR  |= 1UL << UART4_TX_PIN;
        EXTI_IMR |= 1UL << UART4_TX_PIN;
    }
    UART4_CR1 |= (1UL << 13);             // Enable UART  (when we write UART4_DR , we reset this bit , so we must enable uart again!!!!!!

}

// Interrupt for Timer 2
void Timer2_Interrupt() iv IVT_INT_TIM2 {

    if(TIM2_SR){
        TIM2_SR = 0x00; // mask
        currentTime++;

       if(canTranslate == 1)
            confirmTime++;
        else
            spaceTime--;
            
        if(confirmTime == CONFIRM_TIME){
            translate();
            confirmTime = canTranslate = 0;
            spaceTime = SPACE_TIME;
        } 
        if(spaceTime == 0)
            fnc(SPACE);
    }
    
}