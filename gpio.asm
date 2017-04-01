_init_GPIO_Pin:
;gpio.c,4 :: 		int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val){
; val start address is: 12 (R3)
; no start address is: 8 (R2)
; port start address is: 4 (R1)
; type start address is: 0 (R0)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
; port end address is: 4 (R1)
; type end address is: 0 (R0)
; type start address is: 0 (R0)
; port start address is: 4 (R1)
; no start address is: 8 (R2)
; val start address is: 12 (R3)
;gpio.c,5 :: 		if(type != OTYPER) no <<= 1;
CMP	R0, #1
IT	EQ
BEQ	L__init_GPIO_Pin40
LSLS	R2, R2, #1
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin0
L__init_GPIO_Pin40:
L_init_GPIO_Pin0:
;gpio.c,7 :: 		switch(type){
; no start address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin1
; type end address is: 0 (R0)
;gpio.c,9 :: 		case MODER:
L_init_GPIO_Pin3:
;gpio.c,10 :: 		switch(port){
IT	AL
BAL	L_init_GPIO_Pin4
; port end address is: 4 (R1)
;gpio.c,11 :: 		case PORT_A:
L_init_GPIO_Pin6:
;gpio.c,12 :: 		GPIOA_MODER   &= ~(3UL << no);
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_MODER+0)
MOVT	R4, #hi_addr(GPIOA_MODER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_MODER+0)
MOVT	R4, #hi_addr(GPIOA_MODER+0)
STR	R5, [R4, #0]
;gpio.c,13 :: 		GPIOA_MODER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_MODER+0)
MOVT	R4, #hi_addr(GPIOA_MODER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_MODER+0)
MOVT	R4, #hi_addr(GPIOA_MODER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,14 :: 		case PORT_B:
L_init_GPIO_Pin7:
;gpio.c,15 :: 		GPIOB_MODER   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_MODER+0)
MOVT	R4, #hi_addr(GPIOB_MODER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_MODER+0)
MOVT	R4, #hi_addr(GPIOB_MODER+0)
STR	R5, [R4, #0]
;gpio.c,16 :: 		GPIOB_MODER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_MODER+0)
MOVT	R4, #hi_addr(GPIOB_MODER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_MODER+0)
MOVT	R4, #hi_addr(GPIOB_MODER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,17 :: 		case PORT_C:
L_init_GPIO_Pin8:
;gpio.c,18 :: 		GPIOC_MODER   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_MODER+0)
MOVT	R4, #hi_addr(GPIOC_MODER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_MODER+0)
MOVT	R4, #hi_addr(GPIOC_MODER+0)
STR	R5, [R4, #0]
;gpio.c,19 :: 		GPIOC_MODER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_MODER+0)
MOVT	R4, #hi_addr(GPIOC_MODER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_MODER+0)
MOVT	R4, #hi_addr(GPIOC_MODER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,20 :: 		case PORT_D:
L_init_GPIO_Pin9:
;gpio.c,21 :: 		GPIOD_MODER   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_MODER+0)
MOVT	R4, #hi_addr(GPIOD_MODER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_MODER+0)
MOVT	R4, #hi_addr(GPIOD_MODER+0)
STR	R5, [R4, #0]
;gpio.c,22 :: 		GPIOD_MODER   |=  (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_MODER+0)
MOVT	R4, #hi_addr(GPIOD_MODER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_MODER+0)
MOVT	R4, #hi_addr(GPIOD_MODER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,23 :: 		case PORT_E:
L_init_GPIO_Pin10:
;gpio.c,24 :: 		GPIOE_MODER    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_MODER+0)
MOVT	R4, #hi_addr(GPIOE_MODER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_MODER+0)
MOVT	R4, #hi_addr(GPIOE_MODER+0)
STR	R5, [R4, #0]
;gpio.c,25 :: 		GPIOE_MODER    |=  (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_MODER+0)
MOVT	R4, #hi_addr(GPIOE_MODER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_MODER+0)
MOVT	R4, #hi_addr(GPIOE_MODER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,26 :: 		default:
L_init_GPIO_Pin11:
;gpio.c,27 :: 		return 1;
MOVS	R0, #1
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,28 :: 		}
L_init_GPIO_Pin4:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin6
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin7
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin8
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin9
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin10
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin11
;gpio.c,29 :: 		case OTYPER:
L_init_GPIO_Pin12:
;gpio.c,30 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin13
; port end address is: 4 (R1)
;gpio.c,31 :: 		case PORT_A:
L_init_GPIO_Pin15:
;gpio.c,32 :: 		GPIOA_OTYPER   &= ~(1UL << no);
MOV	R4, #1
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_OTYPER+0)
MOVT	R4, #hi_addr(GPIOA_OTYPER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_OTYPER+0)
MOVT	R4, #hi_addr(GPIOA_OTYPER+0)
STR	R5, [R4, #0]
;gpio.c,33 :: 		GPIOA_OTYPER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_OTYPER+0)
MOVT	R4, #hi_addr(GPIOA_OTYPER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_OTYPER+0)
MOVT	R4, #hi_addr(GPIOA_OTYPER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,34 :: 		case PORT_B:
L_init_GPIO_Pin16:
;gpio.c,35 :: 		GPIOB_OTYPER   &= ~(1UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #1
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_OTYPER+0)
MOVT	R4, #hi_addr(GPIOB_OTYPER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_OTYPER+0)
MOVT	R4, #hi_addr(GPIOB_OTYPER+0)
STR	R5, [R4, #0]
;gpio.c,36 :: 		GPIOB_OTYPER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_OTYPER+0)
MOVT	R4, #hi_addr(GPIOB_OTYPER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_OTYPER+0)
MOVT	R4, #hi_addr(GPIOB_OTYPER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,37 :: 		case PORT_C:
L_init_GPIO_Pin17:
;gpio.c,38 :: 		GPIOC_OTYPER   &= ~(1UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #1
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_OTYPER+0)
MOVT	R4, #hi_addr(GPIOC_OTYPER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_OTYPER+0)
MOVT	R4, #hi_addr(GPIOC_OTYPER+0)
STR	R5, [R4, #0]
;gpio.c,39 :: 		GPIOC_OTYPER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_OTYPER+0)
MOVT	R4, #hi_addr(GPIOC_OTYPER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_OTYPER+0)
MOVT	R4, #hi_addr(GPIOC_OTYPER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,40 :: 		case PORT_D:
L_init_GPIO_Pin18:
;gpio.c,41 :: 		GPIOD_OTYPER   &= ~(1UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #1
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_OTYPER+0)
MOVT	R4, #hi_addr(GPIOD_OTYPER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_OTYPER+0)
MOVT	R4, #hi_addr(GPIOD_OTYPER+0)
STR	R5, [R4, #0]
;gpio.c,42 :: 		GPIOD_OTYPER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_OTYPER+0)
MOVT	R4, #hi_addr(GPIOD_OTYPER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_OTYPER+0)
MOVT	R4, #hi_addr(GPIOD_OTYPER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,43 :: 		case PORT_E:
L_init_GPIO_Pin19:
;gpio.c,44 :: 		GPIOE_OTYPER   &= ~(1UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #1
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_OTYPER+0)
MOVT	R4, #hi_addr(GPIOE_OTYPER+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_OTYPER+0)
MOVT	R4, #hi_addr(GPIOE_OTYPER+0)
STR	R5, [R4, #0]
;gpio.c,45 :: 		GPIOE_OTYPER   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_OTYPER+0)
MOVT	R4, #hi_addr(GPIOE_OTYPER+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_OTYPER+0)
MOVT	R4, #hi_addr(GPIOE_OTYPER+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,46 :: 		default:
L_init_GPIO_Pin20:
;gpio.c,47 :: 		return 2;
MOVS	R0, #2
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,48 :: 		}
L_init_GPIO_Pin13:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin15
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin16
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin17
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin18
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin19
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin20
;gpio.c,49 :: 		case OSPEEDR:
L_init_GPIO_Pin21:
;gpio.c,50 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin22
; port end address is: 4 (R1)
;gpio.c,51 :: 		case PORT_A:
L_init_GPIO_Pin24:
;gpio.c,52 :: 		GPIOA_OSPEEDR &= ~(3UL << no);
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOA_OSPEEDR+0)
STR	R5, [R4, #0]
;gpio.c,53 :: 		GPIOA_OSPEEDR |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOA_OSPEEDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,54 :: 		case PORT_B:
L_init_GPIO_Pin25:
;gpio.c,55 :: 		GPIOB_OSPEEDR &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOB_OSPEEDR+0)
STR	R5, [R4, #0]
;gpio.c,56 :: 		GPIOB_OSPEEDR |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOB_OSPEEDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,57 :: 		case PORT_C:
L_init_GPIO_Pin26:
;gpio.c,58 :: 		GPIOC_OSPEEDR &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOC_OSPEEDR+0)
STR	R5, [R4, #0]
;gpio.c,59 :: 		GPIOC_OSPEEDR |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOC_OSPEEDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,60 :: 		case PORT_D:
L_init_GPIO_Pin27:
;gpio.c,61 :: 		GPIOD_OSPEEDR &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOD_OSPEEDR+0)
STR	R5, [R4, #0]
;gpio.c,62 :: 		GPIOD_OSPEEDR |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOD_OSPEEDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOD_OSPEEDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,63 :: 		case PORT_E:
L_init_GPIO_Pin28:
;gpio.c,64 :: 		GPIOE_OSPEEDR &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOE_OSPEEDR+0)
STR	R5, [R4, #0]
;gpio.c,65 :: 		GPIOE_OSPEEDR |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOE_OSPEEDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_OSPEEDR+0)
MOVT	R4, #hi_addr(GPIOE_OSPEEDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,66 :: 		default:
L_init_GPIO_Pin29:
;gpio.c,67 :: 		return 3;
MOVS	R0, #3
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,68 :: 		}
L_init_GPIO_Pin22:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin24
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin25
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin26
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin27
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin28
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin29
;gpio.c,69 :: 		case PUPDR:
L_init_GPIO_Pin30:
;gpio.c,70 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin31
; port end address is: 4 (R1)
;gpio.c,71 :: 		case PORT_A:
L_init_GPIO_Pin33:
;gpio.c,72 :: 		GPIOA_PUPDR   &= ~(3UL << no);
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_PUPDR+0)
MOVT	R4, #hi_addr(GPIOA_PUPDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_PUPDR+0)
MOVT	R4, #hi_addr(GPIOA_PUPDR+0)
STR	R5, [R4, #0]
;gpio.c,73 :: 		GPIOA_PUPDR   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_PUPDR+0)
MOVT	R4, #hi_addr(GPIOA_PUPDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_PUPDR+0)
MOVT	R4, #hi_addr(GPIOA_PUPDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,74 :: 		case PORT_B:
L_init_GPIO_Pin34:
;gpio.c,75 :: 		GPIOB_PUPDR   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_PUPDR+0)
MOVT	R4, #hi_addr(GPIOB_PUPDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_PUPDR+0)
MOVT	R4, #hi_addr(GPIOB_PUPDR+0)
STR	R5, [R4, #0]
;gpio.c,76 :: 		GPIOB_PUPDR   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_PUPDR+0)
MOVT	R4, #hi_addr(GPIOB_PUPDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_PUPDR+0)
MOVT	R4, #hi_addr(GPIOB_PUPDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,77 :: 		case PORT_C:
L_init_GPIO_Pin35:
;gpio.c,78 :: 		GPIOC_PUPDR   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_PUPDR+0)
MOVT	R4, #hi_addr(GPIOC_PUPDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_PUPDR+0)
MOVT	R4, #hi_addr(GPIOC_PUPDR+0)
STR	R5, [R4, #0]
;gpio.c,79 :: 		GPIOC_PUPDR   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_PUPDR+0)
MOVT	R4, #hi_addr(GPIOC_PUPDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_PUPDR+0)
MOVT	R4, #hi_addr(GPIOC_PUPDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,80 :: 		case PORT_D:
L_init_GPIO_Pin36:
;gpio.c,81 :: 		GPIOD_PUPDR   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_PUPDR+0)
MOVT	R4, #hi_addr(GPIOD_PUPDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_PUPDR+0)
MOVT	R4, #hi_addr(GPIOD_PUPDR+0)
STR	R5, [R4, #0]
;gpio.c,82 :: 		GPIOD_PUPDR   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_PUPDR+0)
MOVT	R4, #hi_addr(GPIOD_PUPDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_PUPDR+0)
MOVT	R4, #hi_addr(GPIOD_PUPDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,83 :: 		case PORT_E:
L_init_GPIO_Pin37:
;gpio.c,84 :: 		GPIOE_PUPDR   &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_PUPDR+0)
MOVT	R4, #hi_addr(GPIOE_PUPDR+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_PUPDR+0)
MOVT	R4, #hi_addr(GPIOE_PUPDR+0)
STR	R5, [R4, #0]
;gpio.c,85 :: 		GPIOE_PUPDR   |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_PUPDR+0)
MOVT	R4, #hi_addr(GPIOE_PUPDR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_PUPDR+0)
MOVT	R4, #hi_addr(GPIOE_PUPDR+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,86 :: 		default:
L_init_GPIO_Pin38:
;gpio.c,87 :: 		return 4;
MOVS	R0, #4
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,88 :: 		}
L_init_GPIO_Pin31:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin33
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin34
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin35
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin36
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin37
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin38
;gpio.c,89 :: 		default:
L_init_GPIO_Pin39:
;gpio.c,90 :: 		return 5;
MOVS	R0, #5
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,91 :: 		}
L_init_GPIO_Pin1:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
; type start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_init_GPIO_Pin3
CMP	R0, #1
IT	EQ
BEQ	L_init_GPIO_Pin12
CMP	R0, #2
IT	EQ
BEQ	L_init_GPIO_Pin21
CMP	R0, #3
IT	EQ
BEQ	L_init_GPIO_Pin30
; type end address is: 0 (R0)
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin39
;gpio.c,93 :: 		}
L_end_init_GPIO_Pin:
BX	LR
; end of _init_GPIO_Pin
