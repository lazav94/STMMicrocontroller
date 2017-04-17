_init_GPIO_Pin:
;gpio.c,24 :: 		int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val){
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
;gpio.c,25 :: 		if(type != OTYPER) no <<= 1;
CMP	R0, #1
IT	EQ
BEQ	L__init_GPIO_Pin62
LSLS	R2, R2, #1
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin0
L__init_GPIO_Pin62:
L_init_GPIO_Pin0:
;gpio.c,27 :: 		switch(type){
; no start address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin1
; type end address is: 0 (R0)
;gpio.c,29 :: 		case MODER:
L_init_GPIO_Pin3:
;gpio.c,30 :: 		switch(port){
IT	AL
BAL	L_init_GPIO_Pin4
; port end address is: 4 (R1)
;gpio.c,31 :: 		case PORT_A:
L_init_GPIO_Pin6:
;gpio.c,32 :: 		GPIOA_MODER   &= ~(3UL << no);
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
;gpio.c,33 :: 		GPIOA_MODER   |= (val << no); return 0;
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
;gpio.c,34 :: 		case PORT_B:
L_init_GPIO_Pin7:
;gpio.c,35 :: 		GPIOB_MODER   &= ~(3UL << no);
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
;gpio.c,36 :: 		GPIOB_MODER   |= (val << no); return 0;
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
;gpio.c,37 :: 		case PORT_C:
L_init_GPIO_Pin8:
;gpio.c,38 :: 		GPIOC_MODER   &= ~(3UL << no);
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
;gpio.c,39 :: 		GPIOC_MODER   |= (val << no); return 0;
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
;gpio.c,40 :: 		case PORT_D:
L_init_GPIO_Pin9:
;gpio.c,41 :: 		GPIOD_MODER   &= ~(3UL << no);
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
;gpio.c,42 :: 		GPIOD_MODER   |=  (val << no); return 0;
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
;gpio.c,43 :: 		case PORT_E:
L_init_GPIO_Pin10:
;gpio.c,44 :: 		GPIOE_MODER    &= ~(3UL << no);
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
;gpio.c,45 :: 		GPIOE_MODER    |=  (val << no); return 0;
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
;gpio.c,46 :: 		default:
L_init_GPIO_Pin11:
;gpio.c,47 :: 		return 1;
MOVS	R0, #1
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,48 :: 		}
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
;gpio.c,49 :: 		case OTYPER:
L_init_GPIO_Pin12:
;gpio.c,50 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin13
; port end address is: 4 (R1)
;gpio.c,51 :: 		case PORT_A:
L_init_GPIO_Pin15:
;gpio.c,52 :: 		GPIOA_OTYPER   &= ~(1UL << no);
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
;gpio.c,53 :: 		GPIOA_OTYPER   |= (val << no); return 0;
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
;gpio.c,54 :: 		case PORT_B:
L_init_GPIO_Pin16:
;gpio.c,55 :: 		GPIOB_OTYPER   &= ~(1UL << no);
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
;gpio.c,56 :: 		GPIOB_OTYPER   |= (val << no); return 0;
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
;gpio.c,57 :: 		case PORT_C:
L_init_GPIO_Pin17:
;gpio.c,58 :: 		GPIOC_OTYPER   &= ~(1UL << no);
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
;gpio.c,59 :: 		GPIOC_OTYPER   |= (val << no); return 0;
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
;gpio.c,60 :: 		case PORT_D:
L_init_GPIO_Pin18:
;gpio.c,61 :: 		GPIOD_OTYPER   &= ~(1UL << no);
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
;gpio.c,62 :: 		GPIOD_OTYPER   |= (val << no); return 0;
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
;gpio.c,63 :: 		case PORT_E:
L_init_GPIO_Pin19:
;gpio.c,64 :: 		GPIOE_OTYPER   &= ~(1UL << no);
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
;gpio.c,65 :: 		GPIOE_OTYPER   |= (val << no); return 0;
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
;gpio.c,66 :: 		default:
L_init_GPIO_Pin20:
;gpio.c,67 :: 		return 2;
MOVS	R0, #2
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,68 :: 		}
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
;gpio.c,69 :: 		case OSPEEDR:
L_init_GPIO_Pin21:
;gpio.c,70 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin22
; port end address is: 4 (R1)
;gpio.c,71 :: 		case PORT_A:
L_init_GPIO_Pin24:
;gpio.c,72 :: 		GPIOA_OSPEEDR &= ~(3UL << no);
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
;gpio.c,73 :: 		GPIOA_OSPEEDR |= (val << no); return 0;
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
;gpio.c,74 :: 		case PORT_B:
L_init_GPIO_Pin25:
;gpio.c,75 :: 		GPIOB_OSPEEDR &= ~(3UL << no);
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
;gpio.c,76 :: 		GPIOB_OSPEEDR |= (val << no); return 0;
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
;gpio.c,77 :: 		case PORT_C:
L_init_GPIO_Pin26:
;gpio.c,78 :: 		GPIOC_OSPEEDR &= ~(3UL << no);
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
;gpio.c,79 :: 		GPIOC_OSPEEDR |= (val << no); return 0;
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
;gpio.c,80 :: 		case PORT_D:
L_init_GPIO_Pin27:
;gpio.c,81 :: 		GPIOD_OSPEEDR &= ~(3UL << no);
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
;gpio.c,82 :: 		GPIOD_OSPEEDR |= (val << no); return 0;
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
;gpio.c,83 :: 		case PORT_E:
L_init_GPIO_Pin28:
;gpio.c,84 :: 		GPIOE_OSPEEDR &= ~(3UL << no);
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
;gpio.c,85 :: 		GPIOE_OSPEEDR |= (val << no); return 0;
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
;gpio.c,86 :: 		default:
L_init_GPIO_Pin29:
;gpio.c,87 :: 		return 3;
MOVS	R0, #3
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,88 :: 		}
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
;gpio.c,89 :: 		case PUPDR:
L_init_GPIO_Pin30:
;gpio.c,90 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin31
; port end address is: 4 (R1)
;gpio.c,91 :: 		case PORT_A:
L_init_GPIO_Pin33:
;gpio.c,92 :: 		GPIOA_PUPDR   &= ~(3UL << no);
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
;gpio.c,93 :: 		GPIOA_PUPDR   |= (val << no); return 0;
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
;gpio.c,94 :: 		case PORT_B:
L_init_GPIO_Pin34:
;gpio.c,95 :: 		GPIOB_PUPDR   &= ~(3UL << no);
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
;gpio.c,96 :: 		GPIOB_PUPDR   |= (val << no); return 0;
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
;gpio.c,97 :: 		case PORT_C:
L_init_GPIO_Pin35:
;gpio.c,98 :: 		GPIOC_PUPDR   &= ~(3UL << no);
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
;gpio.c,99 :: 		GPIOC_PUPDR   |= (val << no); return 0;
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
;gpio.c,100 :: 		case PORT_D:
L_init_GPIO_Pin36:
;gpio.c,101 :: 		GPIOD_PUPDR   &= ~(3UL << no);
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
;gpio.c,102 :: 		GPIOD_PUPDR   |= (val << no); return 0;
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
;gpio.c,103 :: 		case PORT_E:
L_init_GPIO_Pin37:
;gpio.c,104 :: 		GPIOE_PUPDR   &= ~(3UL << no);
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
;gpio.c,105 :: 		GPIOE_PUPDR   |= (val << no); return 0;
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
;gpio.c,106 :: 		default:
L_init_GPIO_Pin38:
;gpio.c,107 :: 		return 4;
MOVS	R0, #4
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,108 :: 		}
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
;gpio.c,109 :: 		case AFRL:
L_init_GPIO_Pin39:
;gpio.c,110 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin40
; port end address is: 4 (R1)
;gpio.c,111 :: 		case PORT_A:
L_init_GPIO_Pin42:
;gpio.c,112 :: 		GPIOA_AFRL    &= ~(3UL << no);
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_AFRL+0)
MOVT	R4, #hi_addr(GPIOA_AFRL+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_AFRL+0)
MOVT	R4, #hi_addr(GPIOA_AFRL+0)
STR	R5, [R4, #0]
;gpio.c,113 :: 		GPIOA_AFRL    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_AFRL+0)
MOVT	R4, #hi_addr(GPIOA_AFRL+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_AFRL+0)
MOVT	R4, #hi_addr(GPIOA_AFRL+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,114 :: 		case PORT_B:
L_init_GPIO_Pin43:
;gpio.c,115 :: 		GPIOB_AFRL    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_AFRL+0)
MOVT	R4, #hi_addr(GPIOB_AFRL+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_AFRL+0)
MOVT	R4, #hi_addr(GPIOB_AFRL+0)
STR	R5, [R4, #0]
;gpio.c,116 :: 		GPIOB_AFRL    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_AFRL+0)
MOVT	R4, #hi_addr(GPIOB_AFRL+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_AFRL+0)
MOVT	R4, #hi_addr(GPIOB_AFRL+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,117 :: 		case PORT_C:
L_init_GPIO_Pin44:
;gpio.c,118 :: 		GPIOC_AFRL    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_AFRL+0)
MOVT	R4, #hi_addr(GPIOC_AFRL+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_AFRL+0)
MOVT	R4, #hi_addr(GPIOC_AFRL+0)
STR	R5, [R4, #0]
;gpio.c,119 :: 		GPIOC_AFRL    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_AFRL+0)
MOVT	R4, #hi_addr(GPIOC_AFRL+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_AFRL+0)
MOVT	R4, #hi_addr(GPIOC_AFRL+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,120 :: 		case PORT_D:
L_init_GPIO_Pin45:
;gpio.c,121 :: 		GPIOD_AFRL    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_AFRL+0)
MOVT	R4, #hi_addr(GPIOD_AFRL+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_AFRL+0)
MOVT	R4, #hi_addr(GPIOD_AFRL+0)
STR	R5, [R4, #0]
;gpio.c,122 :: 		GPIOD_AFRL    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_AFRL+0)
MOVT	R4, #hi_addr(GPIOD_AFRL+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_AFRL+0)
MOVT	R4, #hi_addr(GPIOD_AFRL+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,123 :: 		case PORT_E:
L_init_GPIO_Pin46:
;gpio.c,124 :: 		GPIOE_AFRL    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_AFRL+0)
MOVT	R4, #hi_addr(GPIOE_AFRL+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_AFRL+0)
MOVT	R4, #hi_addr(GPIOE_AFRL+0)
STR	R5, [R4, #0]
;gpio.c,125 :: 		GPIOE_AFRL    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_AFRL+0)
MOVT	R4, #hi_addr(GPIOE_AFRL+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_AFRL+0)
MOVT	R4, #hi_addr(GPIOE_AFRL+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,126 :: 		default:
L_init_GPIO_Pin47:
;gpio.c,127 :: 		return 4;
MOVS	R0, #4
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,128 :: 		}
L_init_GPIO_Pin40:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin42
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin43
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin44
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin45
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin46
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin47
;gpio.c,129 :: 		case AFRH:
L_init_GPIO_Pin48:
;gpio.c,130 :: 		switch(port){
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
IT	AL
BAL	L_init_GPIO_Pin49
; port end address is: 4 (R1)
;gpio.c,131 :: 		case PORT_A:
L_init_GPIO_Pin51:
;gpio.c,132 :: 		GPIOA_AFRH    &= ~(3UL << no);
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOA_AFRH+0)
MOVT	R4, #hi_addr(GPIOA_AFRH+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_AFRH+0)
MOVT	R4, #hi_addr(GPIOA_AFRH+0)
STR	R5, [R4, #0]
;gpio.c,133 :: 		GPIOA_AFRH    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOA_AFRH+0)
MOVT	R4, #hi_addr(GPIOA_AFRH+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOA_AFRH+0)
MOVT	R4, #hi_addr(GPIOA_AFRH+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,134 :: 		case PORT_B:
L_init_GPIO_Pin52:
;gpio.c,135 :: 		GPIOB_AFRH    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOB_AFRH+0)
MOVT	R4, #hi_addr(GPIOB_AFRH+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_AFRH+0)
MOVT	R4, #hi_addr(GPIOB_AFRH+0)
STR	R5, [R4, #0]
;gpio.c,136 :: 		GPIOB_AFRH    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOB_AFRH+0)
MOVT	R4, #hi_addr(GPIOB_AFRH+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOB_AFRH+0)
MOVT	R4, #hi_addr(GPIOB_AFRH+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,137 :: 		case PORT_C:
L_init_GPIO_Pin53:
;gpio.c,138 :: 		GPIOC_AFRH    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOC_AFRH+0)
MOVT	R4, #hi_addr(GPIOC_AFRH+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_AFRH+0)
MOVT	R4, #hi_addr(GPIOC_AFRH+0)
STR	R5, [R4, #0]
;gpio.c,139 :: 		GPIOC_AFRH    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOC_AFRH+0)
MOVT	R4, #hi_addr(GPIOC_AFRH+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOC_AFRH+0)
MOVT	R4, #hi_addr(GPIOC_AFRH+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,140 :: 		case PORT_D:
L_init_GPIO_Pin54:
;gpio.c,141 :: 		GPIOD_AFRH    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOD_AFRH+0)
MOVT	R4, #hi_addr(GPIOD_AFRH+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_AFRH+0)
MOVT	R4, #hi_addr(GPIOD_AFRH+0)
STR	R5, [R4, #0]
;gpio.c,142 :: 		GPIOD_AFRH    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOD_AFRH+0)
MOVT	R4, #hi_addr(GPIOD_AFRH+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOD_AFRH+0)
MOVT	R4, #hi_addr(GPIOD_AFRH+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,143 :: 		case PORT_E:
L_init_GPIO_Pin55:
;gpio.c,144 :: 		GPIOE_AFRH    &= ~(3UL << no);
; no start address is: 8 (R2)
; val start address is: 12 (R3)
MOV	R4, #3
LSLS	R4, R2
MVN	R5, R4
MOVW	R4, #lo_addr(GPIOE_AFRH+0)
MOVT	R4, #hi_addr(GPIOE_AFRH+0)
LDR	R4, [R4, #0]
AND	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_AFRH+0)
MOVT	R4, #hi_addr(GPIOE_AFRH+0)
STR	R5, [R4, #0]
;gpio.c,145 :: 		GPIOE_AFRH    |= (val << no); return 0;
LSL	R5, R3, R2
; val end address is: 12 (R3)
; no end address is: 8 (R2)
MOVW	R4, #lo_addr(GPIOE_AFRH+0)
MOVT	R4, #hi_addr(GPIOE_AFRH+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_AFRH+0)
MOVT	R4, #hi_addr(GPIOE_AFRH+0)
STR	R5, [R4, #0]
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,146 :: 		default:
L_init_GPIO_Pin56:
;gpio.c,147 :: 		return 4;
MOVS	R0, #4
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,148 :: 		}
L_init_GPIO_Pin49:
; no start address is: 8 (R2)
; val start address is: 12 (R3)
; port start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_init_GPIO_Pin51
CMP	R1, #1
IT	EQ
BEQ	L_init_GPIO_Pin52
CMP	R1, #2
IT	EQ
BEQ	L_init_GPIO_Pin53
CMP	R1, #3
IT	EQ
BEQ	L_init_GPIO_Pin54
CMP	R1, #4
IT	EQ
BEQ	L_init_GPIO_Pin55
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin56
;gpio.c,149 :: 		default:
L_init_GPIO_Pin57:
;gpio.c,150 :: 		return 5;
MOVS	R0, #5
SXTH	R0, R0
IT	AL
BAL	L_end_init_GPIO_Pin
;gpio.c,151 :: 		}
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
CMP	R0, #4
IT	EQ
BEQ	L_init_GPIO_Pin39
CMP	R0, #5
IT	EQ
BEQ	L_init_GPIO_Pin48
; type end address is: 0 (R0)
; port end address is: 4 (R1)
; val end address is: 12 (R3)
; no end address is: 8 (R2)
IT	AL
BAL	L_init_GPIO_Pin57
;gpio.c,153 :: 		}
L_end_init_GPIO_Pin:
BX	LR
; end of _init_GPIO_Pin
_init_UART4_Register:
;gpio.c,156 :: 		int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val){
; val start address is: 8 (R2)
; no start address is: 4 (R1)
; type start address is: 0 (R0)
; val end address is: 8 (R2)
; no end address is: 4 (R1)
; type end address is: 0 (R0)
; type start address is: 0 (R0)
; no start address is: 4 (R1)
; val start address is: 8 (R2)
;gpio.c,157 :: 		switch(type){
IT	AL
BAL	L_init_UART4_Register58
; type end address is: 0 (R0)
;gpio.c,159 :: 		case CR1:
L_init_UART4_Register60:
;gpio.c,160 :: 		UART4_CR1 &= ~(val << no);
LSL	R5, R2, R1
; no end address is: 4 (R1)
; val end address is: 8 (R2)
MVN	R4, R5
MOVW	R3, #lo_addr(UART4_CR1+0)
MOVT	R3, #hi_addr(UART4_CR1+0)
LDR	R3, [R3, #0]
AND	R4, R3, R4, LSL #0
MOVW	R3, #lo_addr(UART4_CR1+0)
MOVT	R3, #hi_addr(UART4_CR1+0)
STR	R4, [R3, #0]
;gpio.c,161 :: 		UART4_CR1 |=   val << no;
MOVW	R3, #lo_addr(UART4_CR1+0)
MOVT	R3, #hi_addr(UART4_CR1+0)
LDR	R3, [R3, #0]
ORR	R4, R3, R5, LSL #0
MOVW	R3, #lo_addr(UART4_CR1+0)
MOVT	R3, #hi_addr(UART4_CR1+0)
STR	R4, [R3, #0]
;gpio.c,162 :: 		break;
IT	AL
BAL	L_init_UART4_Register59
;gpio.c,165 :: 		default: return -1;
L_init_UART4_Register61:
MOVW	R0, #65535
SXTH	R0, R0
IT	AL
BAL	L_end_init_UART4_Register
;gpio.c,167 :: 		}
L_init_UART4_Register58:
; val start address is: 8 (R2)
; no start address is: 4 (R1)
; type start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_init_UART4_Register60
; type end address is: 0 (R0)
; no end address is: 4 (R1)
; val end address is: 8 (R2)
IT	AL
BAL	L_init_UART4_Register61
L_init_UART4_Register59:
;gpio.c,168 :: 		return 0;
MOVS	R0, #0
SXTH	R0, R0
;gpio.c,169 :: 		}
L_end_init_UART4_Register:
BX	LR
; end of _init_UART4_Register
