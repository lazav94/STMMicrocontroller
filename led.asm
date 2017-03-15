_init_LEDs:
;led.c,4 :: 		void init_LEDs(){
;led.c,6 :: 		RCC_AHB1ENR    |= (1UL << 4);      // Enable GPIOD clock
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;led.c,9 :: 		GPIOE_MODER    &= ~(3UL << 2*12);    // Clear bits in MODER
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;led.c,10 :: 		GPIOE_MODER    |=  (1UL << 2*12);    // Set pin PE12 to Output (01)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;led.c,12 :: 		GPIOE_OTYPER   &= ~(1UL << 12);      // Output type register: Output push-pull  (just one bti)
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
STR	R1, [R0, #0]
;led.c,14 :: 		GPIOE_OSPEEDR  &= ~(3UL << 2*12);    // Clear bits in OSPEEDR
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;led.c,15 :: 		GPIOE_OSPEEDR  |=  (2UL << 2*12);    // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;led.c,17 :: 		GPIOE_PUPDR    &= ~(3UL << 2*12);    // Clear bits in PUPDR
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;led.c,18 :: 		GPIOE_PUPDR    |=  (1UL << 2*12);    // Set Pull-down   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;led.c,21 :: 		GPIOE_MODER    &= ~(3UL << 2*15);    // Clear bits for MODER (mode register)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;led.c,22 :: 		GPIOE_MODER    |=  (1UL << 2*15);    // Set pin PE15 to Output (01)
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1073741824
MOVW	R0, #lo_addr(GPIOE_MODER+0)
MOVT	R0, #hi_addr(GPIOE_MODER+0)
STR	R1, [R0, #0]
;led.c,24 :: 		GPIOE_OTYPER   &= ~(1UL << 15);      // Output type register: Output push-pull  (just one bti)
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OTYPER+0)
MOVT	R0, #hi_addr(GPIOE_OTYPER+0)
STR	R1, [R0, #0]
;led.c,26 :: 		GPIOE_OSPEEDR  &= ~(3UL << 2*15);    // Clear bits in OSPEEDR (Output SPEED Register)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;led.c,27 :: 		GPIOE_OSPEEDR  |=  (2UL << 2*15);    // Set High speed   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOE_OSPEEDR+0)
STR	R1, [R0, #0]
;led.c,29 :: 		GPIOE_PUPDR    &= ~(3UL << 2*15);    // Clear bits for pupdr (pull-up/pull-down register)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;led.c,30 :: 		GPIOE_PUPDR    |=  (1UL << 2*15);    // Set Pull-down   (2h = 10b)
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1073741824
MOVW	R0, #lo_addr(GPIOE_PUPDR+0)
MOVT	R0, #hi_addr(GPIOE_PUPDR+0)
STR	R1, [R0, #0]
;led.c,32 :: 		}
L_end_init_LEDs:
BX	LR
; end of _init_LEDs
