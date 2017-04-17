#ifndef _TIMERS_H_
#define _TIMERS_H_

#define INTERRUPT_TIME 100    //Interrupt on 100us for timer init

#define RESET_TIME 200 //for reset (BUTTON 2)    2sec

/****TIMER2 PARAMS****
  1s  = 1000 / 2 (1000 = 2s)
  1ms = 1
  NOTE: for faster interrupt change PSC (exaple: if PSC = 1600 , for ARR = 1 interrupt is on 1us)
*********************/





extern volatile int currentTime;

// Timer initialize - Timer 2
// General purpose timers
// RCC APB1 peripheral clock enable register
void init_Timer2();



#endif