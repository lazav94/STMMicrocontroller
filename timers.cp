#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/timers.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/timers.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/timers.h"
extern volatile int currentTime;




void init_Timer2();
#line 3 "C:/Users/Lazar.Vasic/Desktop/MIPS/timers.c"
void init_Timer2(){
 currentTime = 0;
 RCC_APB1ENR |= (1UL << 0);
 TIM2_CR1 &= ~(1UL << 0);
 TIM2_PSC = 16000;
 TIM2_ARR =  500 ;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER |= 1;
 TIM2_CR1 |= (1UL << 0);

}

void enter_sleep(){
#line 24 "C:/Users/Lazar.Vasic/Desktop/MIPS/timers.c"
 }
