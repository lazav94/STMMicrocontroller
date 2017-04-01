_init_LEDs:
;main2.c,5 :: 		void init_LEDs(){
;main2.c,7 :: 		RCC_AHB1ENR    |= (1UL << 4);      // Enable GPIOD clock
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;main2.c,10 :: 		GPIOE_MODER    &= ~(3UL << 2*12);    // Clear bits in MODER
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;main2.c,11 :: 		GPIOE_MODER    |=  (1UL << 2*12);    // Set pin PE12 to Output (01)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;main2.c,13 :: 		GPIOE_OTYPER   &= ~(1UL << 12);      // Output type register: Output push-pull  (just one bti)
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
STR	R1, [R0, #0]
;main2.c,15 :: 		GPIOE_OSPEEDR  &= ~(3UL << 2*12);    // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;main2.c,16 :: 		GPIOE_OSPEEDR  |=  (2UL << 2*12);    // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;main2.c,18 :: 		GPIOE_PUPDR    &= ~(3UL << 2*12);    // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;main2.c,19 :: 		GPIOE_PUPDR    |=  (1UL << 2*12);    // Set Pull-down   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;main2.c,22 :: 		GPIOE_MODER    &= ~(3UL << 2*15);    // Clear bits for MODER (mode register)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;main2.c,23 :: 		GPIOE_MODER    |=  (1UL << 2*15);    // Set pin PE15 to Output (01)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1073741824
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;main2.c,25 :: 		GPIOE_OTYPER   &= ~(1UL << 15);      // Output type register: Output push-pull  (just one bti)
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
STR	R1, [R0, #0]
;main2.c,27 :: 		GPIOE_OSPEEDR  &= ~(3UL << 2*15);    // Clear bits in OSPEEDR (Output SPEED Register)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;main2.c,28 :: 		GPIOE_OSPEEDR  |=  (2UL << 2*15);    // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;main2.c,30 :: 		GPIOE_PUPDR    &= ~(3UL << 2*15);    // Clear bits for pupdr (pull-up/pull-down register)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;main2.c,31 :: 		GPIOE_PUPDR    |=  (1UL << 2*15);    // Set Pull-down   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1073741824
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;main2.c,33 :: 		}
L_end_init_LEDs:
BX	LR
; end of _init_LEDs
_doSomething:
;main2.c,37 :: 		void doSomething(){
;main2.c,38 :: 		while(1){
L_doSomething0:
;main2.c,39 :: 		LED_1 = !LED_1;
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main2.c,40 :: 		LED_2 = !LED_1;
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main2.c,41 :: 		}
IT	AL
BAL	L_doSomething0
;main2.c,42 :: 		}
L_end_doSomething:
BX	LR
; end of _doSomething
_main:
;main2.c,44 :: 		void main(){
;main2.c,45 :: 		init_LEDs();
BL	_init_LEDs+0
;main2.c,46 :: 		Delay_ms(100);                        // Delay for stabilization initialization
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;main2.c,48 :: 		doSomething();                        // Infinity loop (dummy loop)
BL	_doSomething+0
;main2.c,50 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
