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
MOVS	R3, #2
MOVS	R2, #0
MOVS	R1, #4
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;button.c,7 :: 		init_GPIO_Pin(PUPDR,   LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  PULL_UP);
MOVS	R3, #1
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
;button.c,12 :: 		EXTI_IMR       |= 1;                 // Interrupt mask on line (1)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,13 :: 		EXTI_FTSR      |= 1;                 // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,16 :: 		NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;button.c,19 :: 		init_GPIO_Pin(MODER,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, INPUT);
MOV	R3, #0
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;button.c,20 :: 		init_GPIO_Pin(OSPEEDR, RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, HIGH);
MOVS	R3, #2
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;button.c,21 :: 		init_GPIO_Pin(PUPDR,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, PULL_UP);
MOVS	R3, #1
MOVS	R2, #10
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;button.c,23 :: 		SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;button.c,27 :: 		EXTI_IMR       |= (1 << 10);         // Interrupt mask on line (10)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,28 :: 		EXTI_FTSR      |= (1 << 10);         // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,31 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;button.c,33 :: 		}
L_end_init_Buttons:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Buttons
_init_Buttons_2:
;button.c,35 :: 		void init_Buttons_2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;button.c,37 :: 		GPIOE_MODER    &= ~(3UL << 2*0);   // Clear bits in MODER - Input (00)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;button.c,39 :: 		GPIOE_OSPEEDR  &= ~(3UL << 2*0);   // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,40 :: 		GPIOE_OSPEEDR  |=  2UL << 2*0;   // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,42 :: 		GPIOE_PUPDR    &= ~(3UL << 2*0);   // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;button.c,43 :: 		GPIOE_PUPDR    |=  1UL << 2*0;   // Set Pull-down  (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;button.c,45 :: 		SYSCFG_EXTICR1 |= 0x4;               // SYStem Configuration Controler - EXTernal Interrupt Configuration Register 1
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;button.c,48 :: 		EXTI_IMR       |= 1;                 // Interrupt mask on line (1)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,49 :: 		EXTI_FTSR      |= 1;                 // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,52 :: 		NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;button.c,55 :: 		GPIOA_MODER    &= ~(3UL << 2*10);  // Clear bits in MODER - Input (00)
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;button.c,57 :: 		GPIOA_OSPEEDR  &= ~(3UL << 2*10);  // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,58 :: 		GPIOA_OSPEEDR  |=  2UL << 2*10;  // Set High speed - (2h = 10b)
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;button.c,60 :: 		SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;button.c,62 :: 		GPIOA_PUPDR    &= ~(3UL << 2*10);  // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;button.c,63 :: 		GPIOA_PUPDR    |=  1UL << 2*10;  // Set Pull-down (2h = 10b)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1048576
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;button.c,65 :: 		EXTI_IMR       |= (1 << 10);         // Interrupt mask on line (10)
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;button.c,66 :: 		EXTI_FTSR      |= (1 << 10);         // Fall edge (press button)
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;button.c,69 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;button.c,71 :: 		}
L_end_init_Buttons_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Buttons_2
