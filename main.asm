_init_all:
;main.c,80 :: 		void init_all(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,86 :: 		RCC_APB2ENR |= (1 << 14);             //  System configuration controller clock enable
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;main.c,87 :: 		init_Lcd();
BL	_init_Lcd+0
;main.c,88 :: 		init_Timer2();
BL	_init_Timer2+0
;main.c,89 :: 		init_Buttons();
BL	_init_Buttons+0
;main.c,90 :: 		init_LEDs();
BL	_init_LEDs+0
;main.c,91 :: 		init_UART();
BL	_init_UART+0
;main.c,92 :: 		}
L_end_init_all:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_all
_welcome:
;main.c,94 :: 		void welcome(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,95 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,96 :: 		LCD_CURSOR(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_LCD_CURSOR+0
;main.c,97 :: 		LCD_CURSOR_ONN();
BL	_LCD_CURSOR_ONN+0
;main.c,103 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,104 :: 		}
L_end_welcome:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _welcome
_doSomething:
;main.c,106 :: 		void doSomething(){
;main.c,107 :: 		while(1);
L_doSomething0:
IT	AL
BAL	L_doSomething0
;main.c,108 :: 		}
L_end_doSomething:
BX	LR
; end of _doSomething
_main:
;main.c,110 :: 		void main(){
;main.c,111 :: 		init_all();                           // Initalize LCD, LEDs, Buttons, UART, Timer...
BL	_init_all+0
;main.c,112 :: 		Delay_ms(100);                        // Delay for stabilization initialization
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;main.c,113 :: 		welcome();                            // Welcome screen (LCD print & LEDs blik...)
BL	_welcome+0
;main.c,114 :: 		doSomething();                        // Infinity loop (dummy loop)
BL	_doSomething+0
;main.c,116 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Button1_Interrupt:
;main.c,121 :: 		void Button1_Interrupt() iv IVT_INT_EXTI0 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,122 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_Button1_Interrupt4:
SUBS	R7, R7, #1
BNE	L_Button1_Interrupt4
NOP
NOP
;main.c,124 :: 		if( EXTI_FTSR & (1UL)){         // is Button PE0 pressed
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_Button1_Interrupt6
;main.c,125 :: 		riseTimeB1 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_riseTimeB1+0)
MOVT	R0, #hi_addr(_riseTimeB1+0)
STRH	R1, [R0, #0]
;main.c,126 :: 		EXTI_FTSR &= ~(1UL);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,127 :: 		EXTI_RTSR |= 1 ;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,128 :: 		}
IT	AL
BAL	L_Button1_Interrupt7
L_Button1_Interrupt6:
;main.c,129 :: 		else if ( EXTI_RTSR & (1UL)){    // is Button PE0 realesed
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_Button1_Interrupt8
;main.c,130 :: 		if(letter_cnt == 0) LCD_CLEAR_SCREEN();
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Button1_Interrupt9
BL	_LCD_CLEAR_SCREEN+0
L_Button1_Interrupt9:
;main.c,131 :: 		fallTimeB1 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB1+0)
MOVT	R0, #hi_addr(_fallTimeB1+0)
STRH	R1, [R0, #0]
;main.c,132 :: 		EXTI_RTSR &= ~(1UL);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,133 :: 		EXTI_FTSR |= 1 ;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,135 :: 		if(fallTimeB1 - riseTimeB1 < DASH_TIME)   // DOT
MOVW	R0, #lo_addr(_riseTimeB1+0)
MOVT	R0, #hi_addr(_riseTimeB1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB1+0)
MOVT	R0, #hi_addr(_fallTimeB1+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
UXTH	R0, R0
CMP	R0, #2
IT	CS
BCS	L_Button1_Interrupt10
;main.c,136 :: 		fnc(DOT);
MOVS	R0, #46
BL	_fnc+0
IT	AL
BAL	L_Button1_Interrupt11
L_Button1_Interrupt10:
;main.c,138 :: 		fnc(DASH);
MOVS	R0, #45
BL	_fnc+0
L_Button1_Interrupt11:
;main.c,139 :: 		} else{
IT	AL
BAL	L_Button1_Interrupt12
L_Button1_Interrupt8:
;main.c,140 :: 		LCD_PRINT_STRING("Button1 Error");
MOVW	R0, #lo_addr(?lstr37_main+0)
MOVT	R0, #hi_addr(?lstr37_main+0)
BL	_LCD_PRINT_STRING+0
;main.c,141 :: 		}
L_Button1_Interrupt12:
L_Button1_Interrupt7:
;main.c,143 :: 		EXTI_PR  = 0x01;                             // clear interraput    -- Pending bit
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,144 :: 		EXTI_IMR |= 1;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,145 :: 		}
L_end_Button1_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button1_Interrupt
_Button2_Interrupt:
;main.c,148 :: 		void Button2_Interrupt() iv IVT_INT_EXTI15_10 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,149 :: 		Delay_ms(10);
MOVW	R7, #41129
MOVT	R7, #1
NOP
NOP
L_Button2_Interrupt13:
SUBS	R7, R7, #1
BNE	L_Button2_Interrupt13
NOP
NOP
;main.c,151 :: 		if( EXTI_FTSR & (1UL << 10)){         // is Button PA10 pressed
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1024
CMP	R0, #0
IT	EQ
BEQ	L_Button2_Interrupt15
;main.c,152 :: 		if(letter_cnt == 0) LCD_CLEAR_SCREEN();
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Button2_Interrupt16
BL	_LCD_CLEAR_SCREEN+0
L_Button2_Interrupt16:
;main.c,153 :: 		riseTimeB2 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_riseTimeB2+0)
MOVT	R0, #hi_addr(_riseTimeB2+0)
STRH	R1, [R0, #0]
;main.c,154 :: 		EXTI_FTSR &= ~(1UL << 10);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,155 :: 		EXTI_RTSR |= (1 << 10);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,156 :: 		}else if ( EXTI_RTSR & (1UL << 10)){        // is Button PA10 realesed
IT	AL
BAL	L_Button2_Interrupt17
L_Button2_Interrupt15:
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1024
CMP	R0, #0
IT	EQ
BEQ	L_Button2_Interrupt18
;main.c,158 :: 		fallTimeB2 = currentTime;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB2+0)
MOVT	R0, #hi_addr(_fallTimeB2+0)
STRH	R1, [R0, #0]
;main.c,159 :: 		EXTI_RTSR &= ~(1UL << 10);
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,160 :: 		EXTI_FTSR |= (1  << 10);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,162 :: 		if(fallTimeB2 - riseTimeB2 < RESET_TIME){   // DOT
MOVW	R0, #lo_addr(_riseTimeB2+0)
MOVT	R0, #hi_addr(_riseTimeB2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_fallTimeB2+0)
MOVT	R0, #hi_addr(_fallTimeB2+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
UXTH	R0, R0
CMP	R0, #2
IT	CS
BCS	L_Button2_Interrupt19
;main.c,163 :: 		translate();
BL	_translate+0
;main.c,164 :: 		}else {                               // DASH
IT	AL
BAL	L_Button2_Interrupt20
L_Button2_Interrupt19:
;main.c,165 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,166 :: 		}
L_Button2_Interrupt20:
;main.c,168 :: 		}else
IT	AL
BAL	L_Button2_Interrupt21
L_Button2_Interrupt18:
;main.c,169 :: 		LCD_PRINT_STRING("Button2 Error");
MOVW	R0, #lo_addr(?lstr38_main+0)
MOVT	R0, #hi_addr(?lstr38_main+0)
BL	_LCD_PRINT_STRING+0
L_Button2_Interrupt21:
L_Button2_Interrupt17:
;main.c,171 :: 		EXTI_PR = (0x01 << 10);                      // clear interraput
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,172 :: 		EXTI_IMR |= (1 << 10);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,173 :: 		}
L_end_Button2_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button2_Interrupt
_UART_Interrupt:
;main.c,176 :: 		void UART_Interrupt() iv IVT_INT_UART4  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,178 :: 		if(UART4_SR & 0x20){
MOVW	R0, #lo_addr(UART4_SR+0)
MOVT	R0, #hi_addr(UART4_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	EQ
BEQ	L_UART_Interrupt22
;main.c,179 :: 		uart_rd = ((char)(UART4_DR & 0x01FF));
MOVW	R0, #lo_addr(UART4_DR+0)
MOVT	R0, #hi_addr(UART4_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #511
AND	R0, R1, R0, LSL #0
UXTB	R1, R0
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
STRB	R1, [R0, #0]
;main.c,180 :: 		LCD_CLEAR_SCREEN();
BL	_LCD_CLEAR_SCREEN+0
;main.c,181 :: 		LCD_PRINT_CHAR(uart_rd);
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
BL	_LCD_PRINT_CHAR+0
;main.c,182 :: 		LCD_PRINT_STRING(" -> ");
MOVW	R0, #lo_addr(?lstr39_main+0)
MOVT	R0, #hi_addr(?lstr39_main+0)
BL	_LCD_PRINT_STRING+0
;main.c,183 :: 		convert(uart_rd);
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
BL	_convert+0
;main.c,184 :: 		LCD_PRINT_STRING(letter);
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_LCD_PRINT_STRING+0
;main.c,185 :: 		}
IT	AL
BAL	L_UART_Interrupt23
L_UART_Interrupt22:
;main.c,186 :: 		else if( UART4_SR & 0x80){
MOVW	R0, #lo_addr(UART4_SR+0)
MOVT	R0, #hi_addr(UART4_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #128
CMP	R0, #0
IT	EQ
BEQ	L_UART_Interrupt24
;main.c,187 :: 		UART4_CR1 &= ~(1UL << 7);         // disable TXEIE bit
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;main.c,188 :: 		UART4_DR = (uart_tr & 0x01FF);
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
;main.c,189 :: 		}
L_UART_Interrupt24:
L_UART_Interrupt23:
;main.c,191 :: 		UART4_CR1 |= (1UL << 13);             // Enable UART  (when we write UART4_DR , we reset this bit , so we must enable uart again!!!!!!
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;main.c,193 :: 		}
L_end_UART_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART_Interrupt
_Timer2_Interrupt:
;main.c,196 :: 		void Timer2_Interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,197 :: 		if(TIM2_SR){
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_Interrupt25
;main.c,198 :: 		currentTime++;
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_currentTime+0)
MOVT	R0, #hi_addr(_currentTime+0)
STRH	R1, [R0, #0]
;main.c,199 :: 		TIM2_SR = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;main.c,200 :: 		}else{
IT	AL
BAL	L_Timer2_Interrupt26
L_Timer2_Interrupt25:
;main.c,201 :: 		LCD_PRINT_STRING("TIMER2 Error");
MOVW	R0, #lo_addr(?lstr40_main+0)
MOVT	R0, #hi_addr(?lstr40_main+0)
BL	_LCD_PRINT_STRING+0
;main.c,202 :: 		}
L_Timer2_Interrupt26:
;main.c,203 :: 		}
L_end_Timer2_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_Interrupt
