_set_lcd_en:
;lcd.c,7 :: 		void set_lcd_en()  { GPIOC_ODR |=  (1UL << LCD_EN_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_en:
BX	LR
; end of _set_lcd_en
_clear_lcd_en:
;lcd.c,8 :: 		void clear_lcd_en(){ GPIOC_ODR &= ~(1UL << LCD_EN_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #8192
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_en:
BX	LR
; end of _clear_lcd_en
_set_lcd_rs:
;lcd.c,10 :: 		void set_lcd_rs()  { GPIOC_ODR |=  (1UL << LCD_RS_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_rs:
BX	LR
; end of _set_lcd_rs
_clear_lcd_rs:
;lcd.c,11 :: 		void clear_lcd_rs(){ GPIOC_ODR &= ~(1UL << LCD_RS_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_rs:
BX	LR
; end of _clear_lcd_rs
_set_lcd_d4:
;lcd.c,13 :: 		void set_lcd_d4()  { GPIOC_ODR |=  (1UL << LCD_D4_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_d4:
BX	LR
; end of _set_lcd_d4
_clear_lcd_d4:
;lcd.c,14 :: 		void clear_lcd_d4(){ GPIOC_ODR &= ~(1UL << LCD_D4_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_d4:
BX	LR
; end of _clear_lcd_d4
_set_lcd_d5:
;lcd.c,16 :: 		void set_lcd_d5()  { GPIOC_ODR |=  (1UL << LCD_D5_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_d5:
BX	LR
; end of _set_lcd_d5
_clear_lcd_d5:
;lcd.c,17 :: 		void clear_lcd_d5(){ GPIOC_ODR &= ~(1UL << LCD_D5_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_d5:
BX	LR
; end of _clear_lcd_d5
_set_lcd_d6:
;lcd.c,19 :: 		void set_lcd_d6()  { GPIOC_ODR |=  (1UL << LCD_D6_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_d6:
BX	LR
; end of _set_lcd_d6
_clear_lcd_d6:
;lcd.c,20 :: 		void clear_lcd_d6(){ GPIOC_ODR &= ~(1UL << LCD_D6_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_d6:
BX	LR
; end of _clear_lcd_d6
_set_lcd_d7:
;lcd.c,22 :: 		void set_lcd_d7()  { GPIOC_ODR |=  (1UL << LCD_D7_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_set_lcd_d7:
BX	LR
; end of _set_lcd_d7
_clear_lcd_d7:
;lcd.c,23 :: 		void clear_lcd_d7(){ GPIOC_ODR &= ~(1UL << LCD_D7_PIN); }
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
L_end_clear_lcd_d7:
BX	LR
; end of _clear_lcd_d7
_lcd_gpio_init:
;lcd.c,25 :: 		void lcd_gpio_init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,27 :: 		RCC_AHB1ENR    |= (1UL << 2) ;
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;lcd.c,31 :: 		init_GPIO_Pin(MODER,   LCD_EN_PORT, LCD_EN_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #13
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,32 :: 		init_GPIO_Pin(MODER,   LCD_RS_PORT, LCD_RS_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #4
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,33 :: 		init_GPIO_Pin(MODER,   LCD_D4_PORT, LCD_D4_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #3
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,34 :: 		init_GPIO_Pin(MODER,   LCD_D5_PORT, LCD_D5_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #2
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,35 :: 		init_GPIO_Pin(MODER,   LCD_D6_PORT, LCD_D6_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,36 :: 		init_GPIO_Pin(MODER,   LCD_D7_PORT, LCD_D7_PIN  ,OUTPUT);
MOV	R3, #1
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;lcd.c,40 :: 		init_GPIO_Pin(OTYPER,  LCD_EN_PORT, LCD_EN_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #13
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,41 :: 		init_GPIO_Pin(OTYPER,  LCD_RS_PORT, LCD_RS_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #4
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,42 :: 		init_GPIO_Pin(OTYPER,  LCD_D4_PORT, LCD_D4_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #3
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,43 :: 		init_GPIO_Pin(OTYPER,  LCD_D5_PORT, LCD_D5_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #2
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,44 :: 		init_GPIO_Pin(OTYPER,  LCD_D6_PORT, LCD_D6_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,45 :: 		init_GPIO_Pin(OTYPER,  LCD_D7_PORT, LCD_D7_PIN  ,PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;lcd.c,49 :: 		init_GPIO_Pin(OSPEEDR, LCD_EN_PORT, LCD_EN_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #13
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,50 :: 		init_GPIO_Pin(OSPEEDR, LCD_RS_PORT, LCD_RS_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #4
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,51 :: 		init_GPIO_Pin(OSPEEDR, LCD_D4_PORT, LCD_D4_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #3
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,52 :: 		init_GPIO_Pin(OSPEEDR, LCD_D5_PORT, LCD_D5_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #2
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,53 :: 		init_GPIO_Pin(OSPEEDR, LCD_D6_PORT, LCD_D6_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #1
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,54 :: 		init_GPIO_Pin(OSPEEDR, LCD_D7_PORT, LCD_D7_PIN  ,HIGH);
MOVS	R3, #2
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;lcd.c,57 :: 		init_GPIO_Pin(PUPDR,   LCD_EN_PORT, LCD_EN_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #13
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,58 :: 		init_GPIO_Pin(PUPDR,   LCD_RS_PORT, LCD_RS_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #4
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,59 :: 		init_GPIO_Pin(PUPDR,   LCD_D4_PORT, LCD_D4_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #3
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,60 :: 		init_GPIO_Pin(PUPDR,   LCD_D5_PORT, LCD_D5_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #2
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,61 :: 		init_GPIO_Pin(PUPDR,   LCD_D6_PORT, LCD_D6_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,62 :: 		init_GPIO_Pin(PUPDR,   LCD_D7_PORT, LCD_D7_PIN  ,NO_PULL_PUSH);
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;lcd.c,65 :: 		}
L_end_lcd_gpio_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lcd_gpio_init
_lcd_gpio_init_2:
;lcd.c,66 :: 		void lcd_gpio_init_2(){
;lcd.c,69 :: 		RCC_AHB1ENR    |= (1UL << 2) ;
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;lcd.c,72 :: 		GPIOC_MODER    &= ~(3UL << 2*13);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,73 :: 		GPIOC_MODER    &= ~(3UL << 2*4);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,74 :: 		GPIOC_MODER    &= ~(3UL << 2*3);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,75 :: 		GPIOC_MODER    &= ~(3UL << 2*2);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,76 :: 		GPIOC_MODER    &= ~(3UL << 2*1);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,77 :: 		GPIOC_MODER    &= ~(3UL << 2*0);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,80 :: 		GPIOC_MODER    |= (1UL << 2*13);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #67108864
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,81 :: 		GPIOC_MODER    |= (1UL << 2*4);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,82 :: 		GPIOC_MODER    |= (1UL << 2*3);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,83 :: 		GPIOC_MODER    |= (1UL << 2*2);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,84 :: 		GPIOC_MODER    |= (1UL << 2*1);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,85 :: 		GPIOC_MODER    |= (1UL << 2*0);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
;lcd.c,89 :: 		GPIOC_OTYPER   &= ~(3UL << 13);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #24576
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,90 :: 		GPIOC_OTYPER   &= ~(3UL << 4);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,91 :: 		GPIOC_OTYPER   &= ~(3UL << 3);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #24
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,92 :: 		GPIOC_OTYPER   &= ~(3UL << 2);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,93 :: 		GPIOC_OTYPER   &= ~(3UL << 1);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #6
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,94 :: 		GPIOC_OTYPER   &= ~(3UL << 0);
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
;lcd.c,97 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*13);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,98 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*4);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,99 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*3);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,100 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*2);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,101 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*1);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,102 :: 		GPIOC_OSPEEDR  &= ~(3UL << 2*0);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,105 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*13);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #134217728
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,106 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*4);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,107 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*3);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,108 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*2);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,109 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*1);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,110 :: 		GPIOC_OSPEEDR  |=  (2UL << 2*0);
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
;lcd.c,113 :: 		GPIOC_PUPDR    &= ~(3UL << 2*13);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,114 :: 		GPIOC_PUPDR    &= ~(3UL << 2*4);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,115 :: 		GPIOC_PUPDR    &= ~(3UL << 2*3);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,116 :: 		GPIOC_PUPDR    &= ~(3UL << 2*2);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,117 :: 		GPIOC_PUPDR    &= ~(3UL << 2*1);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,118 :: 		GPIOC_PUPDR    &= ~(3UL << 2*0);
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;lcd.c,119 :: 		}
L_end_lcd_gpio_init_2:
BX	LR
; end of _lcd_gpio_init_2
_lcd_data_line_write:
;lcd.c,121 :: 		void lcd_data_line_write(char d){
; d start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; d end address is: 0 (R0)
; d start address is: 8 (R2)
;lcd.c,123 :: 		set_lcd_en();
BL	_set_lcd_en+0
;lcd.c,124 :: 		if(d&0x80) set_lcd_d7();
AND	R1, R2, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write0
BL	_set_lcd_d7+0
IT	AL
BAL	L_lcd_data_line_write1
L_lcd_data_line_write0:
;lcd.c,125 :: 		else clear_lcd_d7();
BL	_clear_lcd_d7+0
L_lcd_data_line_write1:
;lcd.c,126 :: 		if(d&0x40) set_lcd_d6();
AND	R1, R2, #64
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write2
BL	_set_lcd_d6+0
IT	AL
BAL	L_lcd_data_line_write3
L_lcd_data_line_write2:
;lcd.c,127 :: 		else clear_lcd_d6();
BL	_clear_lcd_d6+0
L_lcd_data_line_write3:
;lcd.c,128 :: 		if(d&0x20) set_lcd_d5();
AND	R1, R2, #32
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write4
BL	_set_lcd_d5+0
IT	AL
BAL	L_lcd_data_line_write5
L_lcd_data_line_write4:
;lcd.c,129 :: 		else clear_lcd_d5();
BL	_clear_lcd_d5+0
L_lcd_data_line_write5:
;lcd.c,130 :: 		if(d&0x10) set_lcd_d4();
AND	R1, R2, #16
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write6
BL	_set_lcd_d4+0
IT	AL
BAL	L_lcd_data_line_write7
L_lcd_data_line_write6:
;lcd.c,131 :: 		else clear_lcd_d4();
BL	_clear_lcd_d4+0
L_lcd_data_line_write7:
;lcd.c,132 :: 		clear_lcd_en();
BL	_clear_lcd_en+0
;lcd.c,134 :: 		set_lcd_en();
BL	_set_lcd_en+0
;lcd.c,135 :: 		if(d&0x08) set_lcd_d7();
AND	R1, R2, #8
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write8
BL	_set_lcd_d7+0
IT	AL
BAL	L_lcd_data_line_write9
L_lcd_data_line_write8:
;lcd.c,136 :: 		else clear_lcd_d7();
BL	_clear_lcd_d7+0
L_lcd_data_line_write9:
;lcd.c,137 :: 		if(d&0x04) set_lcd_d6();
AND	R1, R2, #4
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write10
BL	_set_lcd_d6+0
IT	AL
BAL	L_lcd_data_line_write11
L_lcd_data_line_write10:
;lcd.c,138 :: 		else clear_lcd_d6();
BL	_clear_lcd_d6+0
L_lcd_data_line_write11:
;lcd.c,139 :: 		if(d&0x02) set_lcd_d5();
AND	R1, R2, #2
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write12
BL	_set_lcd_d5+0
IT	AL
BAL	L_lcd_data_line_write13
L_lcd_data_line_write12:
;lcd.c,140 :: 		else clear_lcd_d5();
BL	_clear_lcd_d5+0
L_lcd_data_line_write13:
;lcd.c,141 :: 		if(d&0x1) set_lcd_d4();
AND	R1, R2, #1
UXTB	R1, R1
; d end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_lcd_data_line_write14
BL	_set_lcd_d4+0
IT	AL
BAL	L_lcd_data_line_write15
L_lcd_data_line_write14:
;lcd.c,142 :: 		else clear_lcd_d4();
BL	_clear_lcd_d4+0
L_lcd_data_line_write15:
;lcd.c,143 :: 		clear_lcd_en();
BL	_clear_lcd_en+0
;lcd.c,145 :: 		Delay_us(1);
MOVW	R7, #9
MOVT	R7, #0
NOP
NOP
L_lcd_data_line_write16:
SUBS	R7, R7, #1
BNE	L_lcd_data_line_write16
NOP
NOP
;lcd.c,148 :: 		}
L_end_lcd_data_line_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lcd_data_line_write
_lcd_Control_Write:
;lcd.c,150 :: 		void lcd_Control_Write(char d){
; d start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; d end address is: 0 (R0)
; d start address is: 8 (R2)
;lcd.c,151 :: 		clear_lcd_rs();
BL	_clear_lcd_rs+0
;lcd.c,152 :: 		lcd_data_line_write(d);
UXTB	R0, R2
; d end address is: 8 (R2)
BL	_lcd_data_line_write+0
;lcd.c,153 :: 		}
L_end_lcd_Control_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lcd_Control_Write
_lcd_Data_Write:
;lcd.c,155 :: 		void lcd_Data_Write(char d){
; d start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; d end address is: 0 (R0)
; d start address is: 8 (R2)
;lcd.c,156 :: 		set_lcd_rs();
BL	_set_lcd_rs+0
;lcd.c,157 :: 		lcd_data_line_write(d);
UXTB	R0, R2
; d end address is: 8 (R2)
BL	_lcd_data_line_write+0
;lcd.c,158 :: 		Delay_us(50);
MOVW	R7, #531
MOVT	R7, #0
NOP
NOP
L_lcd_Data_Write18:
SUBS	R7, R7, #1
BNE	L_lcd_Data_Write18
NOP
NOP
NOP
NOP
;lcd.c,159 :: 		}
L_end_lcd_Data_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lcd_Data_Write
_init_Lcd:
;lcd.c,161 :: 		void init_Lcd(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,163 :: 		lcd_gpio_init();
BL	_lcd_gpio_init+0
;lcd.c,164 :: 		Delay_ms(20);
MOVW	R7, #16723
MOVT	R7, #3
NOP
NOP
L_init_Lcd20:
SUBS	R7, R7, #1
BNE	L_init_Lcd20
NOP
NOP
NOP
NOP
;lcd.c,166 :: 		lcd_Control_Write(0x33);
MOVS	R0, #51
BL	_lcd_Control_Write+0
;lcd.c,167 :: 		Delay_ms(20);
MOVW	R7, #16723
MOVT	R7, #3
NOP
NOP
L_init_Lcd22:
SUBS	R7, R7, #1
BNE	L_init_Lcd22
NOP
NOP
NOP
NOP
;lcd.c,168 :: 		lcd_Control_Write(0x32);
MOVS	R0, #50
BL	_lcd_Control_Write+0
;lcd.c,170 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd24:
SUBS	R7, R7, #1
BNE	L_init_Lcd24
NOP
NOP
NOP
NOP
;lcd.c,172 :: 		lcd_Control_Write(LCD_DISP_INIT);     // 0x28  Start to set LCD function
MOVS	R0, #40
BL	_lcd_Control_Write+0
;lcd.c,173 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd26:
SUBS	R7, R7, #1
BNE	L_init_Lcd26
NOP
NOP
NOP
NOP
;lcd.c,175 :: 		lcd_Control_Write(LCD_DISP_OFF);
MOVS	R0, #8
BL	_lcd_Control_Write+0
;lcd.c,176 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd28:
SUBS	R7, R7, #1
BNE	L_init_Lcd28
NOP
NOP
NOP
NOP
;lcd.c,178 :: 		lcd_Control_Write(LCD_CLEAR_DISPLAY); //0x01  clear LCD
MOVS	R0, #1
BL	_lcd_Control_Write+0
;lcd.c,179 :: 		Delay_us(900);
MOVW	R7, #9598
MOVT	R7, #0
NOP
NOP
L_init_Lcd30:
SUBS	R7, R7, #1
BNE	L_init_Lcd30
NOP
NOP
NOP
;lcd.c,181 :: 		lcd_Control_Write(LCD_INC_MODE);      // set entry mode
MOVS	R0, #6
BL	_lcd_Control_Write+0
;lcd.c,182 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd32:
SUBS	R7, R7, #1
BNE	L_init_Lcd32
NOP
NOP
NOP
NOP
;lcd.c,184 :: 		lcd_Control_Write(LCD_DISP_ON);       // set display to on
MOVS	R0, #12
BL	_lcd_Control_Write+0
;lcd.c,185 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd34:
SUBS	R7, R7, #1
BNE	L_init_Lcd34
NOP
NOP
NOP
NOP
;lcd.c,187 :: 		lcd_Control_Write(LCD_RETRN_HOME);    // move cursor to home and set data address to 0
MOVS	R0, #2
BL	_lcd_Control_Write+0
;lcd.c,188 :: 		Delay_us(20);
MOVW	R7, #211
MOVT	R7, #0
NOP
NOP
L_init_Lcd36:
SUBS	R7, R7, #1
BNE	L_init_Lcd36
NOP
NOP
NOP
NOP
;lcd.c,190 :: 		}
L_end_init_Lcd:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_Lcd
_LCD_CURSOR:
;lcd.c,192 :: 		void LCD_CURSOR(char x, char y){
; y start address is: 4 (R1)
; x start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
UXTB	R4, R1
; y end address is: 4 (R1)
; x end address is: 0 (R0)
; x start address is: 12 (R3)
; y start address is: 16 (R4)
;lcd.c,194 :: 		switch(x){
IT	AL
BAL	L_LCD_CURSOR38
;lcd.c,195 :: 		case 0:  pos = y;      break;
L_LCD_CURSOR40:
; pos start address is: 0 (R0)
UXTB	R0, R4
; pos end address is: 0 (R0)
IT	AL
BAL	L_LCD_CURSOR39
;lcd.c,196 :: 		case 1:  pos = 0x40+y; break;
L_LCD_CURSOR41:
ADDW	R2, R4, #64
; pos start address is: 0 (R0)
UXTB	R0, R2
; pos end address is: 0 (R0)
IT	AL
BAL	L_LCD_CURSOR39
;lcd.c,197 :: 		default: pos = y;      break;
L_LCD_CURSOR42:
; pos start address is: 0 (R0)
UXTB	R0, R4
; pos end address is: 0 (R0)
IT	AL
BAL	L_LCD_CURSOR39
;lcd.c,198 :: 		}
L_LCD_CURSOR38:
CMP	R3, #0
IT	EQ
BEQ	L_LCD_CURSOR40
CMP	R3, #1
IT	EQ
BEQ	L_LCD_CURSOR41
IT	AL
BAL	L_LCD_CURSOR42
L_LCD_CURSOR39:
;lcd.c,200 :: 		lcd_Control_Write(0x80 | pos);
; pos start address is: 0 (R0)
ORR	R2, R0, #128
; pos end address is: 0 (R0)
UXTB	R0, R2
BL	_lcd_Control_Write+0
;lcd.c,201 :: 		cursor_pos = 16 * x + y;
LSLS	R2, R3, #4
SXTH	R2, R2
; x end address is: 12 (R3)
ADDS	R3, R2, R4
; y end address is: 16 (R4)
MOVW	R2, #lo_addr(_cursor_pos+0)
MOVT	R2, #hi_addr(_cursor_pos+0)
STRH	R3, [R2, #0]
;lcd.c,202 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR43:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR43
NOP
NOP
;lcd.c,203 :: 		}
L_end_LCD_CURSOR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR
_LCD_CURSOR_HOME:
;lcd.c,204 :: 		void LCD_CURSOR_HOME(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,205 :: 		lcd_Control_Write(LCD_RETRN_HOME);
MOVS	R0, #2
BL	_lcd_Control_Write+0
;lcd.c,206 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR_HOME45:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR_HOME45
NOP
NOP
;lcd.c,207 :: 		}
L_end_LCD_CURSOR_HOME:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR_HOME
_LCD_CURSOR_OFFF:
;lcd.c,209 :: 		void LCD_CURSOR_OFFF(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,210 :: 		lcd_Control_Write(LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_lcd_Control_Write+0
;lcd.c,211 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR_OFFF47:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR_OFFF47
NOP
NOP
;lcd.c,212 :: 		}
L_end_LCD_CURSOR_OFFF:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR_OFFF
_LCD_CURSOR_ONN:
;lcd.c,214 :: 		void LCD_CURSOR_ONN(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,215 :: 		lcd_Control_Write(LCD_CURSOR_ON);
MOVS	R0, #14
BL	_lcd_Control_Write+0
;lcd.c,216 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR_ONN49:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR_ONN49
NOP
NOP
;lcd.c,217 :: 		}
L_end_LCD_CURSOR_ONN:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR_ONN
_LCD_CURSOR_ALLL:
;lcd.c,218 :: 		void LCD_CURSOR_ALLL(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,219 :: 		lcd_Control_Write(LCD_CURSOR_ALL);
MOVS	R0, #15
BL	_lcd_Control_Write+0
;lcd.c,220 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR_ALLL51:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR_ALLL51
NOP
NOP
;lcd.c,221 :: 		}
L_end_LCD_CURSOR_ALLL:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR_ALLL
_LCD_CURSOR_BLINKK:
;lcd.c,223 :: 		void LCD_CURSOR_BLINKK(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,224 :: 		lcd_Control_Write(LCD_CURSOR_BLINK);
MOVS	R0, #13
BL	_lcd_Control_Write+0
;lcd.c,225 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CURSOR_BLINKK53:
SUBS	R7, R7, #1
BNE	L_LCD_CURSOR_BLINKK53
NOP
NOP
;lcd.c,226 :: 		}
L_end_LCD_CURSOR_BLINKK:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CURSOR_BLINKK
_LCD_CLEAR_SCREEN:
;lcd.c,228 :: 		void LCD_CLEAR_SCREEN(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,229 :: 		cursor_pos = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_cursor_pos+0)
MOVT	R0, #hi_addr(_cursor_pos+0)
STRH	R1, [R0, #0]
;lcd.c,230 :: 		lcd_Control_Write(LCD_CLEAR_DISPLAY);
MOVS	R0, #1
BL	_lcd_Control_Write+0
;lcd.c,231 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_CLEAR_SCREEN55:
SUBS	R7, R7, #1
BNE	L_LCD_CLEAR_SCREEN55
NOP
NOP
;lcd.c,232 :: 		}
L_end_LCD_CLEAR_SCREEN:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_CLEAR_SCREEN
_LCD_RIGHT_SHIFT:
;lcd.c,234 :: 		void LCD_RIGHT_SHIFT(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,235 :: 		lcd_Control_Write(LCD_CUR_MOV_RIGHT);
MOVS	R0, #20
BL	_lcd_Control_Write+0
;lcd.c,236 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_RIGHT_SHIFT57:
SUBS	R7, R7, #1
BNE	L_LCD_RIGHT_SHIFT57
NOP
NOP
;lcd.c,237 :: 		}
L_end_LCD_RIGHT_SHIFT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_RIGHT_SHIFT
_LCD_LEFT_SHIFT:
;lcd.c,239 :: 		void LCD_LEFT_SHIFT(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,240 :: 		lcd_Control_Write(LCD_CUR_MOV_LEFT);
MOVS	R0, #16
BL	_lcd_Control_Write+0
;lcd.c,241 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_LCD_LEFT_SHIFT59:
SUBS	R7, R7, #1
BNE	L_LCD_LEFT_SHIFT59
NOP
NOP
;lcd.c,242 :: 		}
L_end_LCD_LEFT_SHIFT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_LEFT_SHIFT
_LCD_PRINT_STRING:
;lcd.c,244 :: 		void LCD_PRINT_STRING(char* d){
; d start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; d end address is: 0 (R0)
; d start address is: 0 (R0)
MOV	R3, R0
; d end address is: 0 (R0)
;lcd.c,245 :: 		while(*d){
L_LCD_PRINT_STRING61:
; d start address is: 12 (R3)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_LCD_PRINT_STRING62
;lcd.c,246 :: 		lcd_Data_Write(*d);
LDRB	R1, [R3, #0]
UXTB	R0, R1
BL	_lcd_Data_Write+0
;lcd.c,247 :: 		d++;
ADDS	R3, R3, #1
;lcd.c,248 :: 		}
; d end address is: 12 (R3)
IT	AL
BAL	L_LCD_PRINT_STRING61
L_LCD_PRINT_STRING62:
;lcd.c,249 :: 		}
L_end_LCD_PRINT_STRING:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_PRINT_STRING
_LCD_PRINT_CHAR:
;lcd.c,251 :: 		void LCD_PRINT_CHAR(char d){
; d start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; d end address is: 0 (R0)
; d start address is: 20 (R5)
;lcd.c,253 :: 		if(cursor_pos == 16)
MOVW	R1, #lo_addr(_cursor_pos+0)
MOVT	R1, #hi_addr(_cursor_pos+0)
LDRH	R1, [R1, #0]
CMP	R1, #16
IT	NE
BNE	L_LCD_PRINT_CHAR63
;lcd.c,254 :: 		LCD_CURSOR(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_LCD_CURSOR+0
IT	AL
BAL	L_LCD_PRINT_CHAR64
L_LCD_PRINT_CHAR63:
;lcd.c,255 :: 		else if (cursor_pos == 32)
MOVW	R1, #lo_addr(_cursor_pos+0)
MOVT	R1, #hi_addr(_cursor_pos+0)
LDRH	R1, [R1, #0]
CMP	R1, #32
IT	NE
BNE	L_LCD_PRINT_CHAR65
;lcd.c,256 :: 		LCD_CURSOR(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_LCD_CURSOR+0
L_LCD_PRINT_CHAR65:
L_LCD_PRINT_CHAR64:
;lcd.c,257 :: 		cursor_pos++;
MOVW	R1, #lo_addr(_cursor_pos+0)
MOVT	R1, #hi_addr(_cursor_pos+0)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_cursor_pos+0)
MOVT	R1, #hi_addr(_cursor_pos+0)
STRH	R2, [R1, #0]
;lcd.c,258 :: 		if(d != '\0')
CMP	R5, #0
IT	EQ
BEQ	L_LCD_PRINT_CHAR66
;lcd.c,259 :: 		lcd_Data_Write(d);
UXTB	R0, R5
; d end address is: 20 (R5)
BL	_lcd_Data_Write+0
L_LCD_PRINT_CHAR66:
;lcd.c,260 :: 		}
L_end_LCD_PRINT_CHAR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_PRINT_CHAR
