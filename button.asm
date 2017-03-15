_init_Buttons:
;button.c,3 :: 		void init_Buttons(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;button.c,5 :: 		GPIOE_MODER    &= ~((3UL << 2*0));   // Clear bits in MODER - Input (00)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;button.c,7 :: 		GPIOE_OSPEEDR  &= ~((3UL << 2*0));   // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,8 :: 		GPIOE_OSPEEDR  |=  ((2UL << 2*0));   // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,10 :: 		GPIOE_PUPDR    &= ~((3UL << 2*0));   // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;button.c,11 :: 		GPIOE_PUPDR    |=  ((1UL << 2*0));   // Set Pull-down  (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;button.c,13 :: 		SYSCFG_EXTICR1 |= 0x4;               // SYStem Configuration Controler - EXTernal Interrupt Configuration Register 1
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;button.c,16 :: 		EXTI_IMR       |= 1;                 // Interrupt mask on line (1)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,17 :: 		EXTI_FTSR      |= 1;                 // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,20 :: 		NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;button.c,23 :: 		GPIOA_MODER    &= ~((3UL << 2*10));  // Clear bits in MODER - Input (00)
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;button.c,25 :: 		GPIOA_OSPEEDR  &= ~((3UL << 2*10));  // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,26 :: 		GPIOA_OSPEEDR  |=  ((2UL << 2*10));  // Set High speed - (2h = 10b)
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,28 :: 		SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;button.c,30 :: 		GPIOA_PUPDR    &= ~((3UL << 2*10));  // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;button.c,31 :: 		GPIOA_PUPDR    |=  ((1UL << 2*10));  // Set Pull-down (2h = 10b)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1048576
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;button.c,33 :: 		EXTI_IMR       |= (1 << 10);         // Interrupt mask on line (10)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,34 :: 		EXTI_FTSR      |= (1 << 10);         // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,37 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;button.c,39 :: 		}
L_end_init_Buttons:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Buttons
