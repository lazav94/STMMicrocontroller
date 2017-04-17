_init_Buttons:
;button.c,3 :: 		void init_Buttons(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;button.c,5 :: 		init_GPIO_Pin(MODER,   LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  INPUT);
MOV	R3, #0
MOVS	R2, #0
MOVS	R1, #4
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;button.c,6 :: 		init_GPIO_Pin(OSPEEDR, LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  HIGH);
MOV	R3, #2
MOVS	R2, #0
MOVS	R1, #4
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;button.c,7 :: 		init_GPIO_Pin(PUPDR,   LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  PULL_UP);
MOV	R3, #1
MOVS	R2, #0
MOVS	R1, #4
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;button.c,9 :: 		SYSCFG_EXTICR1 |= 0x4;               // SYStem Configuration Controler - EXTernal Interrupt Configuration Register 1
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;button.c,12 :: 		EXTI_IMR       |= 1 << LEFT_BUTTON_PIN;                 // Interrupt mask on line (1)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,13 :: 		EXTI_FTSR      |= 1 << LEFT_BUTTON_PIN;                 // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,17 :: 		NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;button.c,20 :: 		init_GPIO_Pin(MODER,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, INPUT);
MOV	R3, #0
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;button.c,21 :: 		init_GPIO_Pin(OSPEEDR, RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, HIGH);
MOV	R3, #2
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;button.c,22 :: 		init_GPIO_Pin(PUPDR,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, PULL_UP);
MOV	R3, #1
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;button.c,24 :: 		SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;button.c,28 :: 		EXTI_IMR       |= 1 << RIGHT_BUTTON_PIN;         // Interrupt mask on line (10)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,29 :: 		EXTI_FTSR      |= 1 << RIGHT_BUTTON_PIN;         // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,32 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;button.c,34 :: 		}
L_end_init_Buttons:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Buttons
