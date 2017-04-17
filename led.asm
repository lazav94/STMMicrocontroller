_init_LEDs:
;led.c,4 :: 		void init_LEDs(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;led.c,5 :: 		RCC_AHB1ENR    |= (1UL << LEFT_LED_PORT);       // Enable GPIOE clock for left led
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;led.c,8 :: 		init_GPIO_Pin(MODER,   LEFT_LED_PORT,  LEFT_LED_PIN,  OUTPUT);
MOV	R3, #1
MOVS	R2, #12
MOVS	R1, #4
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;led.c,9 :: 		init_GPIO_Pin(OTYPER,  LEFT_LED_PORT,  LEFT_LED_PIN,  PUSH_PULL);
MOV	R3, #0
MOVS	R2, #12
MOVS	R1, #4
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;led.c,10 :: 		init_GPIO_Pin(OSPEEDR, LEFT_LED_PORT,  LEFT_LED_PIN,  HIGH);
MOV	R3, #2
MOVS	R2, #12
MOVS	R1, #4
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;led.c,11 :: 		init_GPIO_Pin(PUPDR,   LEFT_LED_PORT,  LEFT_LED_PIN,  PULL_UP);
MOV	R3, #1
MOVS	R2, #12
MOVS	R1, #4
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;led.c,13 :: 		init_GPIO_Pin(MODER,   RIGHT_LED_PORT, RIGHT_LED_PIN, OUTPUT);
MOV	R3, #1
MOVS	R2, #15
MOVS	R1, #4
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;led.c,14 :: 		init_GPIO_Pin(OTYPER,  RIGHT_LED_PORT, RIGHT_LED_PIN, PUSH_PULL);
MOV	R3, #0
MOVS	R2, #15
MOVS	R1, #4
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;led.c,15 :: 		init_GPIO_Pin(OSPEEDR, RIGHT_LED_PORT, RIGHT_LED_PIN, HIGH);
MOV	R3, #2
MOVS	R2, #15
MOVS	R1, #4
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;led.c,16 :: 		init_GPIO_Pin(PUPDR,   RIGHT_LED_PORT, RIGHT_LED_PIN, PULL_UP);
MOV	R3, #1
MOVS	R2, #15
MOVS	R1, #4
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;led.c,19 :: 		}
L_end_init_LEDs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_LEDs
