#include "timers.h"

void init_Timer2(){
    currentTime  = 0;               // Initial time
    RCC_APB1ENR |=  (1UL << 0);     // RCC_APB1ENR.TIM2EN = 1;    // Bit 0 for Timer2      //TIM2 clock enabled
    TIM2_CR1    &= ~(1UL << 0);     // Counter disable    [TIM2_CR1 bit 0        TIM2_CR1.CEN = 0;
    TIM2_PSC     = 16000;           // The counter clock CK_CNT is equal Fc_psc / (PSC[15:0] + 1)
    TIM2_ARR     = TIME_FOR_DASH;   // Auto-reload value - ARR is the value to be loaded in the actual auto-reload register
    NVIC_IntEnable(IVT_INT_TIM2);   // Nested Vector Interrupt Controller
    TIM2_DIER   |= 1;               // Update interrupt enable [TIM2_DIEr bit 0]    TIM2_DIER.UIE = 1;
    TIM2_CR1    |=  (1UL << 0);     // Counter enable    [TIM2_CR1 bit 0]       TIM2_CR1.CEN = 1;

}

void enter_sleep(){
    // PWR_CR
    // Bit 2 CWUF: Clear wakeup flag   -1: Clear the WUF Wakeup Flag after 2 System clock cycles
   //Bit 1 PDDS: Power-down deepsleep - 1: Enter Standby mode when the CPU enters deepsleep.
/*Bit 0 LPDS: Low-power deepsleep
This bit is set and cleared by software. It works together with the PDDS bit.
0: Voltage regulator on during Stop mode
1: Voltage regulator in low-power mode during Stop mode     */
//The SLEEPDEEP bit of the SCR selects which sleep mode is used  
 }