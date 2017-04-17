_init_all:
;main.c,77 :: 		void init_all(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,83 :: 		RCC_APB2ENR |= (1 << 14);             //  System configuration controller clock enable
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;main.c,85 :: 		init_LEDs();
BL	_init_LEDs+0
;main.c,86 :: 		init_Buttons();
BL	_init_Buttons+0
;main.c,87 :: 		init_UART();
BL	_init_UART+0
;main.c,88 :: 		init_Lcd();
BL	_init_Lcd+0
;main.c,89 :: 		init_Timer2();
BL	_init_Timer2+0
;main.c,91 :: 		}
L_end_init_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_all
_doSomething:
;main.c,95 :: 		void doSomething(){
;main.c,96 :: 		while(1) {
L_doSomething0:
;main.c,97 :: 		asm WFI; // sleep until interrupt
WFI
;main.c,98 :: 		}
IT	AL
BAL	L_doSomething0
;main.c,99 :: 		}
L_end_doSomething:
BX	LR
; end of _doSomething
_main:
;main.c,103 :: 		void main(){
;main.c,105 :: 		init_all();                           // Initalize LCD, LEDs, Buttons, UART, Timer...
BL	_init_all+0
;main.c,106 :: 		Delay_ms(10);                         // Delay for stabilization initialization
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;main.c,108 :: 		doSomething();                      // Infinity loop (dummy loop)
BL	_doSomething+0
;main.c,110 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_ChangeDashTime:
;main.c,112 :: 		void ChangeDashTime(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,113 :: 		LCD_CURSOR(1,9);
MOVS	R1, #9
MOVS	R0, #1
BL	_LCD_CURSOR+0
;main.c,114 :: 		LCD_PRINT_STRING("SPEED:");
MOVW	R0, #lo_addr(?lstr37_main+0)
MOVT	R0, #hi_addr(?lstr37_main+0)
BL	_LCD_PRINT_STRING+0
;main.c,115 :: 		switch(dashTime){
IT	AL
BAL	L_ChangeDashTime4
;main.c,116 :: 		case QUAD_SECOND_DASH:
L_ChangeDashTime6:
;main.c,117 :: 		dotTime = HALF_SECOND_DOT;
MOVS	R1, #2
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
STRH	R1, [R0, #0]
;main.c,118 :: 		dashTime = HALF_SECOND_DASH;
MOVS	R1, #6
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
STRH	R1, [R0, #0]
;main.c,119 :: 		LCD_PRINT_CHAR('1');
MOVS	R0, #49
BL	_LCD_PRINT_CHAR+0
;main.c,120 :: 		break;
IT	AL
BAL	L_ChangeDashTime5
;main.c,121 :: 		case HALF_SECOND_DASH:
L_ChangeDashTime7:
;main.c,122 :: 		dotTime = ONE_SECOND_DOT;
MOVS	R1, #3
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
STRH	R1, [R0, #0]
;main.c,123 :: 		dashTime = ONE_SECOND_DASH;
MOVS	R1, #9
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
STRH	R1, [R0, #0]
;main.c,124 :: 		LCD_PRINT_CHAR('2');
MOVS	R0, #50
BL	_LCD_PRINT_CHAR+0
;main.c,125 :: 		break;
IT	AL
BAL	L_ChangeDashTime5
;main.c,126 :: 		case ONE_SECOND_DASH:
L_ChangeDashTime8:
;main.c,127 :: 		dotTime = TWO_SECOND_DOT;
MOVS	R1, #4
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
STRH	R1, [R0, #0]
;main.c,128 :: 		dashTime = TWO_SECOND_DASH;
MOVS	R1, #12
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
STRH	R1, [R0, #0]
;main.c,129 :: 		LCD_PRINT_CHAR('3');
MOVS	R0, #51
BL	_LCD_PRINT_CHAR+0
;main.c,130 :: 		break;
IT	AL
BAL	L_ChangeDashTime5
;main.c,131 :: 		case TWO_SECOND_DASH:
L_ChangeDashTime9:
;main.c,132 :: 		dotTime = QUAD_SECOND_DOT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
STRH	R1, [R0, #0]
;main.c,133 :: 		dashTime = QUAD_SECOND_DASH;
MOVS	R1, #3
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
STRH	R1, [R0, #0]
;main.c,134 :: 		LCD_PRINT_CHAR('4');
MOVS	R0, #52
BL	_LCD_PRINT_CHAR+0
;main.c,135 :: 		break;
IT	AL
BAL	L_ChangeDashTime5
;main.c,136 :: 		}
L_ChangeDashTime4:
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_ChangeDashTime6
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_ChangeDashTime7
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_ChangeDashTime8
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_ChangeDashTime9
L_ChangeDashTime5:
;main.c,137 :: 		spaceTime = 7*dotTime;
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
LDRH	R1, [R0, #0]
MOVS	R0, #7
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
STRH	R1, [R0, #0]
;main.c,138 :: 		LCD_CURSOR(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_LCD_CURSOR+0
;main.c,139 :: 		}
L_end_ChangeDashTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ChangeDashTime
_Button1_Interrupt:
;main.c,144 :: 		void Button1_Interrupt() iv IVT_INT_EXTI0 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,146 :: 		if( EXTI_FTSR & (1UL << LEFT_BUTTON_PIN)){         // is Button PE0 pressed
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_Button1_Interrupt10
;main.c,147 :: 		LED_11 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,148 :: 		riseTimeB1 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_riseTimeB1+0)
MOVT	R0, #hi_addr(_riseTimeB1+0)
STRH	R1, [R0, #0]
;main.c,149 :: 		EXTI_FTSR &= ~(1UL << LEFT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,150 :: 		EXTI_RTSR |=   1UL << LEFT_BUTTON_PIN;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,151 :: 		}
IT	AL
BAL	L_Button1_Interrupt11
L_Button1_Interrupt10:
;main.c,152 :: 		else if ( EXTI_RTSR & (1UL << LEFT_BUTTON_PIN)){    // is Button PE0 realesed
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_Button1_Interrupt12
;main.c,153 :: 		LED_11 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,154 :: 		if(letter_cnt == 0) LCD_CLEAR_SCREEN();
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Button1_Interrupt13
BL	_LCD_CLEAR_SCREEN+0
L_Button1_Interrupt13:
;main.c,155 :: 		fallTimeB1 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB1+0)
MOVT	R0, #hi_addr(_fallTimeB1+0)
STRH	R1, [R0, #0]
;main.c,156 :: 		EXTI_RTSR &= ~(1UL << LEFT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,157 :: 		EXTI_FTSR |=   1UL << LEFT_BUTTON_PIN;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,159 :: 		canTranslate = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_canTranslate+0)
MOVT	R0, #hi_addr(_canTranslate+0)
STRH	R1, [R0, #0]
;main.c,160 :: 		fnc(((fallTimeB1 - riseTimeB1 < dashTime) ? DOT : DASH));
MOVW	R0, #lo_addr(_riseTimeB1+0)
MOVT	R0, #hi_addr(_riseTimeB1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB1+0)
MOVT	R0, #hi_addr(_fallTimeB1+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_dashTime+0)
MOVT	R0, #hi_addr(_dashTime+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	CS
BCS	L_Button1_Interrupt14
; ?FLOC___Button1_Interrupt?T55 start address is: 0 (R0)
MOVS	R0, #46
; ?FLOC___Button1_Interrupt?T55 end address is: 0 (R0)
IT	AL
BAL	L_Button1_Interrupt15
L_Button1_Interrupt14:
; ?FLOC___Button1_Interrupt?T55 start address is: 0 (R0)
MOVS	R0, #45
; ?FLOC___Button1_Interrupt?T55 end address is: 0 (R0)
L_Button1_Interrupt15:
; ?FLOC___Button1_Interrupt?T55 start address is: 0 (R0)
; ?FLOC___Button1_Interrupt?T55 end address is: 0 (R0)
BL	_fnc+0
;main.c,162 :: 		spaceTime = 7 * dotTime;
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
LDRH	R1, [R0, #0]
MOVS	R0, #7
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
STRH	R1, [R0, #0]
;main.c,164 :: 		}
L_Button1_Interrupt12:
L_Button1_Interrupt11:
;main.c,166 :: 		EXTI_PR  = 0x01;                             // clear interraput    -- Pending bit
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,167 :: 		EXTI_IMR |= 1;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,168 :: 		}
L_end_Button1_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button1_Interrupt
_Button2_Interrupt:
;main.c,171 :: 		void Button2_Interrupt() iv IVT_INT_EXTI15_10 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,173 :: 		if( EXTI_FTSR & (1UL << RIGHT_BUTTON_PIN)){         // is Button PA10 pressed
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1024
CMP	R0, #0
IT	EQ
BEQ	L_Button2_Interrupt16
;main.c,174 :: 		if(letter_cnt == 0) LCD_CLEAR_SCREEN();
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Button2_Interrupt17
BL	_LCD_CLEAR_SCREEN+0
L_Button2_Interrupt17:
;main.c,175 :: 		riseTimeB2 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_riseTimeB2+0)
MOVT	R0, #hi_addr(_riseTimeB2+0)
STRH	R1, [R0, #0]
;main.c,176 :: 		EXTI_FTSR &= ~(1UL << RIGHT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,177 :: 		EXTI_RTSR |= (1UL << RIGHT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,178 :: 		}else if ( EXTI_RTSR & (1UL << RIGHT_BUTTON_PIN)){        // is Button PA10 realesed
IT	AL
BAL	L_Button2_Interrupt18
L_Button2_Interrupt16:
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1024
CMP	R0, #0
IT	EQ
BEQ	L_Button2_Interrupt19
;main.c,179 :: 		fallTimeB2 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB2+0)
MOVT	R0, #hi_addr(_fallTimeB2+0)
STRH	R1, [R0, #0]
;main.c,180 :: 		EXTI_RTSR &= ~(1UL << RIGHT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,181 :: 		EXTI_FTSR |= (1  << RIGHT_BUTTON_PIN);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,183 :: 		if(fallTimeB2 - riseTimeB2 < RESET_TIME){   // DOT
MOVW	R0, #lo_addr(_riseTimeB2+0)
MOVT	R0, #hi_addr(_riseTimeB2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB2+0)
MOVT	R0, #hi_addr(_fallTimeB2+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
UXTH	R0, R0
CMP	R0, #200
IT	CS
BCS	L_Button2_Interrupt20
;main.c,184 :: 		ChangeDashTime();
BL	_ChangeDashTime+0
;main.c,185 :: 		}else {                               // DASH
IT	AL
BAL	L_Button2_Interrupt21
L_Button2_Interrupt20:
;main.c,186 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,187 :: 		LED_11 = LED_22 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,189 :: 		}
L_Button2_Interrupt21:
;main.c,191 :: 		}
L_Button2_Interrupt19:
L_Button2_Interrupt18:
;main.c,193 :: 		EXTI_PR = (0x01 << 10);                      // clear interraput
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,194 :: 		EXTI_IMR |= (1 << 10);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,195 :: 		}
L_end_Button2_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button2_Interrupt
_UART_Interrupt:
;main.c,198 :: 		void UART_Interrupt() iv IVT_INT_UART4  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,200 :: 		if(UART4_SR & 0x20){
MOVW	R0, #lo_addr(UART4_SR+0)
MOVT	R0, #hi_addr(UART4_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	EQ
BEQ	L_UART_Interrupt22
;main.c,201 :: 		uart_rd = ((char)(UART4_DR & 0x01FF));
MOVW	R0, #lo_addr(UART4_DR+0)
MOVT	R0, #hi_addr(UART4_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #511
AND	R0, R1, R0, LSL #0
UXTB	R1, R0
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
STRB	R1, [R0, #0]
;main.c,202 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,203 :: 		LCD_PRINT_CHAR(uart_rd);
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
BL	_LCD_PRINT_CHAR+0
;main.c,204 :: 		LCD_PRINT_STRING(" -> ");
MOVW	R0, #lo_addr(?lstr38_main+0)
MOVT	R0, #hi_addr(?lstr38_main+0)
BL	_LCD_PRINT_STRING+0
;main.c,205 :: 		convert(uart_rd);
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
BL	_convert+0
;main.c,206 :: 		LCD_PRINT_STRING(letter);
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_LCD_PRINT_STRING+0
;main.c,207 :: 		LED_string_translate(letter);
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_LED_string_translate+0
;main.c,209 :: 		EXTI_PR = (1UL << UART4_RX_PIN);
MOVS	R1, #2
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,210 :: 		EXTI_IMR |= (1UL << UART4_RX_PIN);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,212 :: 		}
IT	AL
BAL	L_UART_Interrupt23
L_UART_Interrupt22:
;main.c,213 :: 		else if( UART4_SR & 0x80){
MOVW	R0, #lo_addr(UART4_SR+0)
MOVT	R0, #hi_addr(UART4_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #128
CMP	R0, #0
IT	EQ
BEQ	L_UART_Interrupt24
;main.c,214 :: 		UART4_CR1 &= ~(1UL << UART_TX_INTERRUPT);         // disable TXEIE bit
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;main.c,215 :: 		UART4_DR = (uart_tr & 0x01FF);
MOVW	R0, #lo_addr(_uart_tr+0)
MOVT	R0, #hi_addr(_uart_tr+0)
LDRB	R1, [R0, #0]
MOVW	R0, #511
SXTH	R0, R0
ANDS	R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(UART4_DR+0)
MOVT	R0, #hi_addr(UART4_DR+0)
STR	R1, [R0, #0]
;main.c,216 :: 		EXTI_PR = (1UL << UART4_TX_PIN);
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,217 :: 		EXTI_IMR |= (1UL << UART4_TX_PIN);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,218 :: 		}
L_UART_Interrupt24:
L_UART_Interrupt23:
;main.c,219 :: 		UART4_CR1 |= (1UL << 13);             // Enable UART  (when we write UART4_DR , we reset this bit , so we must enable uart again!!!!!!
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;main.c,221 :: 		}
L_end_UART_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART_Interrupt
_Timer2_Interrupt:
;main.c,224 :: 		void Timer2_Interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,226 :: 		if(TIM2_SR){
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_Interrupt25
;main.c,227 :: 		currentTime++;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
STRH	R1, [R0, #0]
;main.c,228 :: 		TIM2_SR = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;main.c,231 :: 		if(canTranslate == 1)
MOVW	R0, #lo_addr(_canTranslate+0)
MOVT	R0, #hi_addr(_canTranslate+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Timer2_Interrupt26
;main.c,232 :: 		confirmTime++;
MOVW	R0, #lo_addr(_confirmTime+0)
MOVT	R0, #hi_addr(_confirmTime+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_confirmTime+0)
MOVT	R0, #hi_addr(_confirmTime+0)
STRH	R1, [R0, #0]
IT	AL
BAL	L_Timer2_Interrupt27
L_Timer2_Interrupt26:
;main.c,234 :: 		spaceTime--;
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
STRH	R1, [R0, #0]
L_Timer2_Interrupt27:
;main.c,236 :: 		if(confirmTime == CONFIRM_TIME){
MOVW	R0, #lo_addr(_confirmTime+0)
MOVT	R0, #hi_addr(_confirmTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #25
IT	NE
BNE	L_Timer2_Interrupt28
;main.c,238 :: 		translate();
BL	_translate+0
;main.c,239 :: 		confirmTime = canTranslate = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_canTranslate+0)
MOVT	R0, #hi_addr(_canTranslate+0)
STRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_canTranslate+0)
MOVT	R0, #hi_addr(_canTranslate+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_confirmTime+0)
MOVT	R0, #hi_addr(_confirmTime+0)
STRH	R1, [R0, #0]
;main.c,240 :: 		spaceTime = SPACE_TIME;
MOVW	R0, #lo_addr(_dotTime+0)
MOVT	R0, #hi_addr(_dotTime+0)
LDRH	R1, [R0, #0]
MOVS	R0, #7
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
STRH	R1, [R0, #0]
;main.c,241 :: 		}
L_Timer2_Interrupt28:
;main.c,242 :: 		if(spaceTime == 0)
MOVW	R0, #lo_addr(_spaceTime+0)
MOVT	R0, #hi_addr(_spaceTime+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Timer2_Interrupt29
;main.c,243 :: 		fnc(SPACE);
MOVS	R0, #35
BL	_fnc+0
L_Timer2_Interrupt29:
;main.c,245 :: 		}
L_Timer2_Interrupt25:
;main.c,247 :: 		}
L_end_Timer2_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_Interrupt
