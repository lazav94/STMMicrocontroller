_init_Timer2:
;timers.c,3 :: 		void init_Timer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timers.c,4 :: 		currentTime  = 0;               // Initial time
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
STRH	R1, [R0, #0]
;timers.c,5 :: 		RCC_APB1ENR |=  (1UL << 0);     // RCC_APB1ENR.TIM2EN = 1;    // Bit 0 for Timer2      //TIM2 clock enabled
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;timers.c,6 :: 		TIM2_CR1    &= ~(1UL << 0);     // Counter disable    [TIM2_CR1 bit 0        TIM2_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;timers.c,7 :: 		TIM2_PSC     = 16000;           // The counter clock CK_CNT is equal Fc_psc / (PSC[15:0] + 1)
MOVW	R1, #16000
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;timers.c,8 :: 		TIM2_ARR     = TIME_FOR_DASH;   // Auto-reload value - ARR is the value to be loaded in the actual auto-reload register
MOVW	R1, #500
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;timers.c,9 :: 		NVIC_IntEnable(IVT_INT_TIM2);   // Nested Vector Interrupt Controller
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;timers.c,10 :: 		TIM2_DIER   |= 1;               // Update interrupt enable [TIM2_DIEr bit 0]    TIM2_DIER.UIE = 1;
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;timers.c,11 :: 		TIM2_CR1    |=  (1UL << 0);     // Counter enable    [TIM2_CR1 bit 0]       TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;timers.c,13 :: 		}
L_end_init_Timer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Timer2
_enter_sleep:
;timers.c,15 :: 		void enter_sleep(){
;timers.c,24 :: 		}
L_end_enter_sleep:
BX	LR
; end of _enter_sleep
