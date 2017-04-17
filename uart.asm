_init_UART_pins:
;uart.c,21 :: 		void init_UART_pins(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,24 :: 		RCC_AHB1ENR    |=  (1UL << UART4_TX_PORT);      // Enable clock for port A TX
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,26 :: 		RCC_APB1ENR    |=   (1UL << 19);      // Enable UART4 Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,28 :: 		init_GPIO_Pin(MODER,   UART4_TX_PORT, UART4_TX_PIN, ALTERNATIVE_FUNCTION);
MOV	R3, #2
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;uart.c,29 :: 		init_GPIO_Pin(MODER,   UART4_RX_PORT, UART4_RX_PIN, ALTERNATIVE_FUNCTION);
MOV	R3, #2
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;uart.c,31 :: 		init_GPIO_Pin(OTYPER,  UART4_TX_PORT, UART4_TX_PIN, PUSH_PULL);
MOV	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;uart.c,32 :: 		init_GPIO_Pin(OTYPER,  UART4_RX_PORT, UART4_RX_PIN, PUSH_PULL);
MOV	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;uart.c,34 :: 		init_GPIO_Pin(OSPEEDR, UART4_TX_PORT, UART4_TX_PIN, HIGH);
MOV	R3, #2
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;uart.c,35 :: 		init_GPIO_Pin(OSPEEDR, UART4_RX_PORT, UART4_RX_PIN, HIGH);
MOV	R3, #2
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;uart.c,37 :: 		init_GPIO_Pin(PUPDR, UART4_TX_PORT, UART4_TX_PIN, PULL_UP);
MOV	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;uart.c,38 :: 		init_GPIO_Pin(PUPDR, UART4_RX_PORT, UART4_RX_PIN, PULL_UP);
MOV	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;uart.c,42 :: 		GPIOA_AFRL     &= ~(15UL << 0);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,43 :: 		GPIOA_AFRL     &= ~(15UL << 4);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,44 :: 		GPIOA_AFRL     |=  (8UL << 0);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,45 :: 		GPIOA_AFRL     |=  (8UL << 4);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,47 :: 		}
L_end_init_UART_pins:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART_pins
_init_UART:
;uart.c,80 :: 		void init_UART(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,81 :: 		init_UART_pins();
BL	_init_UART_pins+0
;uart.c,94 :: 		UART4_BRR = 0x00000682;
MOVW	R1, #1666
MOVW	R0, #lo_addr(UART4_BRR+0)
MOVT	R0, #hi_addr(UART4_BRR+0)
STR	R1, [R0, #0]
;uart.c,96 :: 		init_UART4_Register(CR1, WORD_LENGTH, WORD_8B);
MOV	R2, #0
MOVS	R1, #12
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,97 :: 		init_UART4_Register(CR1, PARITY, PARITY_DISABLE);
MOV	R2, #0
MOVS	R1, #10
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,99 :: 		init_UART4_Register(CR1, UART_RECEIVE, UART_RX_ON);
MOV	R2, #1
MOV	R1, #2
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,100 :: 		init_UART4_Register(CR1, UART_TRANSMIT, UART_TX_ON);
MOV	R2, #1
MOV	R1, #3
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,102 :: 		init_UART4_Register(CR1, UART_RX_INTERRUPT,UART_RX_INTERRUPT_ON);
MOV	R2, #1
MOV	R1, #5
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,105 :: 		NVIC_IntEnable(IVT_INT_UART4);        // TODO change this!
MOVW	R0, #68
BL	_NVIC_IntEnable+0
;uart.c,107 :: 		init_UART4_Register(CR1, UART4_ED,UART4_ENABLE);
MOV	R2, #1
MOV	R1, #13
MOVS	R0, #1
BL	_init_UART4_Register+0
;uart.c,108 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_UART_2:
;uart.c,111 :: 		void init_UART_2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,112 :: 		init_UART_pins();
BL	_init_UART_pins+0
;uart.c,125 :: 		UART4_BRR = 0x00000682;
MOVW	R1, #1666
MOVW	R0, #lo_addr(UART4_BRR+0)
MOVT	R0, #hi_addr(UART4_BRR+0)
STR	R1, [R0, #0]
;uart.c,127 :: 		UART4_CR1    &= ~(1UL << 12);         // M = 0 => Word lenght = 8b
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,128 :: 		UART4_CR1    &= ~(1UL << 10);         // parity disable
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,130 :: 		UART4_CR1    |= (1UL << 2);           // Receiver enable    (RE)
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,131 :: 		UART4_CR1    |= (1UL << 3);           // Transmitter enable (TE)
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,134 :: 		UART4_CR1    |= (1UL << UART_RX_INTERRUPT);           // RXE interrupt enable - interrupt is generated whenever ORE=1 or RXNE=1 in the USART_SR register
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,137 :: 		NVIC_IntEnable(IVT_INT_UART4);        // TODO change this!
MOVW	R0, #68
BL	_NVIC_IntEnable+0
;uart.c,139 :: 		UART4_CR1 |= (1UL << 13);             // Enable UART
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,140 :: 		}
L_end_init_UART_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART_2
_SendCharInterrupt:
;uart.c,146 :: 		void SendCharInterrupt (int ch)  {
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;uart.c,147 :: 		uart_tr = ch;
MOVW	R1, #lo_addr(_uart_tr+0)
MOVT	R1, #hi_addr(_uart_tr+0)
STRB	R0, [R1, #0]
; ch end address is: 0 (R0)
;uart.c,148 :: 		UART4_CR1 |= (1UL << UART_TX_INTERRUPT);              // Enable intrrupt (TXEIE)
MOVW	R1, #lo_addr(UART4_CR1+0)
MOVT	R1, #hi_addr(UART4_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(UART4_CR1+0)
MOVT	R1, #hi_addr(UART4_CR1+0)
STR	R2, [R1, #0]
;uart.c,149 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_SendCharInterrupt0:
SUBS	R7, R7, #1
BNE	L_SendCharInterrupt0
NOP
NOP
NOP
;uart.c,150 :: 		}
L_end_SendCharInterrupt:
BX	LR
; end of _SendCharInterrupt
_SendStringInterrupt:
;uart.c,152 :: 		void SendStringInterrupt(char *s){
; s start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
MOV	R3, R0
; s end address is: 0 (R0)
;uart.c,153 :: 		while(*s){
L_SendStringInterrupt2:
; s start address is: 12 (R3)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_SendStringInterrupt3
;uart.c,154 :: 		SendCharInterrupt(*s);
LDRB	R1, [R3, #0]
SXTH	R0, R1
BL	_SendCharInterrupt+0
;uart.c,155 :: 		s++;
ADDS	R3, R3, #1
;uart.c,156 :: 		}
; s end address is: 12 (R3)
IT	AL
BAL	L_SendStringInterrupt2
L_SendStringInterrupt3:
;uart.c,157 :: 		}
L_end_SendStringInterrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SendStringInterrupt
_charToInt:
;uart.c,160 :: 		int charToInt(char c){
; c start address is: 0 (R0)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
;uart.c,161 :: 		if( c >= 48 && c <= 57)
CMP	R0, #48
IT	CC
BCC	L__charToInt56
CMP	R0, #57
IT	HI
BHI	L__charToInt55
L__charToInt54:
;uart.c,162 :: 		return c - 48;
SUBW	R1, R0, #48
; c end address is: 0 (R0)
SXTH	R0, R1
IT	AL
BAL	L_end_charToInt
;uart.c,161 :: 		if( c >= 48 && c <= 57)
L__charToInt56:
; c start address is: 0 (R0)
L__charToInt55:
;uart.c,163 :: 		else if ((c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
CMP	R0, #65
IT	CC
BCC	L__charToInt58
CMP	R0, #90
IT	HI
BHI	L__charToInt57
IT	AL
BAL	L__charToInt51
L__charToInt58:
L__charToInt57:
CMP	R0, #97
IT	CC
BCC	L__charToInt60
CMP	R0, #122
IT	HI
BHI	L__charToInt59
IT	AL
BAL	L__charToInt51
; c end address is: 0 (R0)
L__charToInt60:
L__charToInt59:
IT	AL
BAL	L_charToInt14
L__charToInt51:
;uart.c,164 :: 		if(c >= 97 && c <= 122)
; c start address is: 0 (R0)
CMP	R0, #97
IT	CC
BCC	L__charToInt63
CMP	R0, #122
IT	HI
BHI	L__charToInt64
L__charToInt50:
;uart.c,165 :: 		c -= 'a'-'A';
SUBW	R1, R0, #32
UXTB	R0, R1
; c end address is: 0 (R0)
;uart.c,164 :: 		if(c >= 97 && c <= 122)
IT	AL
BAL	L__charToInt62
L__charToInt63:
L__charToInt62:
; c start address is: 0 (R0)
; c end address is: 0 (R0)
IT	AL
BAL	L__charToInt61
L__charToInt64:
L__charToInt61:
;uart.c,166 :: 		return c - 55;
; c start address is: 0 (R0)
SUBW	R1, R0, #55
; c end address is: 0 (R0)
SXTH	R0, R1
IT	AL
BAL	L_end_charToInt
;uart.c,167 :: 		}
L_charToInt14:
;uart.c,168 :: 		else return -1;
MOVW	R0, #65535
SXTH	R0, R0
;uart.c,169 :: 		}
L_end_charToInt:
BX	LR
; end of _charToInt
_LED_char_translate:
;uart.c,171 :: 		void LED_char_translate(char c){
; c start address is: 0 (R0)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
;uart.c,172 :: 		LED_1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;uart.c,173 :: 		if(c == DOT) Delay_ms(ONE_SECOND_DASH);
CMP	R0, #46
IT	NE
BNE	L_LED_char_translate19
; c end address is: 0 (R0)
MOVW	R7, #45246
MOVT	R7, #7
NOP
NOP
L_LED_char_translate20:
SUBS	R7, R7, #1
BNE	L_LED_char_translate20
NOP
NOP
NOP
IT	AL
BAL	L_LED_char_translate22
L_LED_char_translate19:
;uart.c,174 :: 		else         Delay_ms(3*ONE_SECOND_DASH);
MOVW	R7, #4670
MOVT	R7, #23
NOP
NOP
L_LED_char_translate23:
SUBS	R7, R7, #1
BNE	L_LED_char_translate23
NOP
NOP
NOP
L_LED_char_translate22:
;uart.c,175 :: 		LED_1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;uart.c,176 :: 		Delay_ms(ONE_SECOND_DASH);
MOVW	R7, #45246
MOVT	R7, #7
NOP
NOP
L_LED_char_translate25:
SUBS	R7, R7, #1
BNE	L_LED_char_translate25
NOP
NOP
NOP
;uart.c,177 :: 		}
L_end_LED_char_translate:
BX	LR
; end of _LED_char_translate
_LED_string_translate:
;uart.c,179 :: 		void LED_string_translate(char *s){
; s start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
MOV	R3, R0
; s end address is: 0 (R0)
;uart.c,180 :: 		while(*s){
L_LED_string_translate27:
; s start address is: 12 (R3)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_LED_string_translate28
;uart.c,181 :: 		LED_char_translate(*s);
LDRB	R1, [R3, #0]
UXTB	R0, R1
BL	_LED_char_translate+0
;uart.c,182 :: 		s++;
ADDS	R3, R3, #1
;uart.c,184 :: 		}
; s end address is: 12 (R3)
IT	AL
BAL	L_LED_string_translate27
L_LED_string_translate28:
;uart.c,185 :: 		}
L_end_LED_string_translate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LED_string_translate
_convert:
;uart.c,187 :: 		int convert(char c){
; c start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; c end address is: 0 (R0)
; c start address is: 8 (R2)
;uart.c,188 :: 		if(charToInt(c) == -1) strcpy(letter, "!");
UXTB	R0, R2
BL	_charToInt+0
CMP	R0, #-1
IT	NE
BNE	L_convert29
; c end address is: 8 (R2)
MOVW	R1, #lo_addr(?lstr37_uart+0)
MOVT	R1, #hi_addr(?lstr37_uart+0)
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_strcpy+0
IT	AL
BAL	L_convert30
L_convert29:
;uart.c,190 :: 		strcpy(letter, alpha[charToInt(c)]);
; c start address is: 8 (R2)
UXTB	R0, R2
; c end address is: 8 (R2)
BL	_charToInt+0
LSLS	R2, R0, #2
MOVW	R1, #lo_addr(uart_alpha+0)
MOVT	R1, #hi_addr(uart_alpha+0)
ADDS	R1, R1, R2
LDR	R1, [R1, #0]
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_strcpy+0
;uart.c,192 :: 		}
L_convert30:
;uart.c,193 :: 		}
L_end_convert:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _convert
_convertString:
;uart.c,195 :: 		void convertString(char *s){
; s start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
;uart.c,196 :: 		strcpy(word, "");
MOVW	R1, #lo_addr(?lstr38_uart+0)
MOVT	R1, #hi_addr(?lstr38_uart+0)
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcpy+0
; s end address is: 0 (R0)
LDR	R0, [SP, #4]
MOV	R6, R0
;uart.c,197 :: 		while(*s){
L_convertString31:
; s start address is: 24 (R6)
LDRB	R1, [R6, #0]
CMP	R1, #0
IT	EQ
BEQ	L_convertString32
;uart.c,198 :: 		convert(*s);
LDRB	R1, [R6, #0]
UXTB	R0, R1
BL	_convert+0
;uart.c,199 :: 		strcat(word, letter);
MOVW	R1, #lo_addr(_letter+0)
MOVT	R1, #hi_addr(_letter+0)
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcat+0
;uart.c,200 :: 		strcat(word, " ");
MOVW	R1, #lo_addr(?lstr39_uart+0)
MOVT	R1, #hi_addr(?lstr39_uart+0)
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcat+0
;uart.c,201 :: 		s++;
ADDS	R6, R6, #1
;uart.c,202 :: 		}
; s end address is: 24 (R6)
IT	AL
BAL	L_convertString31
L_convertString32:
;uart.c,203 :: 		}
L_end_convertString:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _convertString
_findLetter:
;uart.c,207 :: 		int findLetter(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,209 :: 		for(i = 0; i < ALPHABET_SIZE; i++){
; i start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; i end address is: 16 (R4)
L_findLetter33:
; i start address is: 16 (R4)
CMP	R4, #36
IT	GE
BGE	L_findLetter34
;uart.c,210 :: 		if(strcmp(letter, alpha[i]) == 0)
LSLS	R1, R4, #2
MOVW	R0, #lo_addr(uart_alpha+0)
MOVT	R0, #hi_addr(uart_alpha+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
MOV	R1, R0
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_findLetter36
;uart.c,211 :: 		return i;
SXTH	R0, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_end_findLetter
L_findLetter36:
;uart.c,209 :: 		for(i = 0; i < ALPHABET_SIZE; i++){
; i start address is: 16 (R4)
ADDS	R4, R4, #1
SXTH	R4, R4
;uart.c,212 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_findLetter33
L_findLetter34:
;uart.c,213 :: 		return -1;
MOVW	R0, #65535
SXTH	R0, R0
;uart.c,214 :: 		}
L_end_findLetter:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _findLetter
_intToChar:
;uart.c,216 :: 		char intToChar(int i){
; i start address is: 0 (R0)
; i end address is: 0 (R0)
; i start address is: 0 (R0)
;uart.c,217 :: 		if( i >= 0 && i <= 9)
CMP	R0, #0
IT	LT
BLT	L__intToChar67
CMP	R0, #9
IT	GT
BGT	L__intToChar66
L__intToChar65:
;uart.c,218 :: 		return 48 + i;
ADDW	R1, R0, #48
; i end address is: 0 (R0)
UXTB	R0, R1
IT	AL
BAL	L_end_intToChar
;uart.c,217 :: 		if( i >= 0 && i <= 9)
L__intToChar67:
; i start address is: 0 (R0)
L__intToChar66:
;uart.c,219 :: 		else if ( i < ALPHABET_SIZE)
CMP	R0, #36
IT	GE
BGE	L_intToChar41
;uart.c,220 :: 		return 55 + i;
ADDW	R1, R0, #55
; i end address is: 0 (R0)
UXTB	R0, R1
IT	AL
BAL	L_end_intToChar
L_intToChar41:
;uart.c,221 :: 		return '!';
MOVS	R0, #33
;uart.c,222 :: 		}
L_end_intToChar:
BX	LR
; end of _intToChar
_clearLetter:
;uart.c,224 :: 		void clearLetter(){
;uart.c,226 :: 		for(i = 0; i < 6; letter[i++] = '\0');
; i start address is: 8 (R2)
MOVS	R2, #0
SXTH	R2, R2
; i end address is: 8 (R2)
L_clearLetter42:
; i start address is: 8 (R2)
CMP	R2, #6
IT	GE
BGE	L_clearLetter43
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_clearLetter42
L_clearLetter43:
;uart.c,227 :: 		letter_cnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
STRH	R1, [R0, #0]
;uart.c,228 :: 		}
L_end_clearLetter:
BX	LR
; end of _clearLetter
_translate:
;uart.c,231 :: 		void translate(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;uart.c,235 :: 		letter[letter_cnt + 1] = '\0';
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;uart.c,236 :: 		temp = findLetter();
BL	_findLetter+0
STRH	R0, [SP, #4]
;uart.c,238 :: 		LCD_PRINT_STRING(" = ");
MOVW	R0, #lo_addr(?lstr40_uart+0)
MOVT	R0, #hi_addr(?lstr40_uart+0)
BL	_LCD_PRINT_STRING+0
;uart.c,239 :: 		if(temp != -1){
LDRSH	R0, [SP, #4]
CMP	R0, #-1
IT	EQ
BEQ	L_translate45
;uart.c,240 :: 		strcpy(letters[letters_cnt++] ,letter);
MOVW	R0, #lo_addr(_letters_cnt+0)
MOVT	R0, #hi_addr(_letters_cnt+0)
LDRH	R1, [R0, #0]
MOVS	R0, #6
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_letters+0)
MOVT	R0, #hi_addr(_letters+0)
ADDS	R0, R0, R1
MOVW	R1, #lo_addr(_letter+0)
MOVT	R1, #hi_addr(_letter+0)
BL	_strcpy+0
MOVW	R0, #lo_addr(_letters_cnt+0)
MOVT	R0, #hi_addr(_letters_cnt+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_letters_cnt+0)
MOVT	R0, #hi_addr(_letters_cnt+0)
STRH	R1, [R0, #0]
;uart.c,241 :: 		LCD_PRINT_CHAR(intToChar(temp));
LDRSH	R0, [SP, #4]
BL	_intToChar+0
BL	_LCD_PRINT_CHAR+0
;uart.c,242 :: 		SendCharInterrupt(intToChar(temp));
LDRSH	R0, [SP, #4]
BL	_intToChar+0
BL	_SendCharInterrupt+0
;uart.c,244 :: 		} else{                            //ERROR not found this sequence of dots and dashes
IT	AL
BAL	L_translate46
L_translate45:
;uart.c,245 :: 		LCD_PRINT_STRING('!');
MOVS	R0, #33
BL	_LCD_PRINT_STRING+0
;uart.c,246 :: 		SendCharInterrupt('!');
MOVS	R0, #33
SXTH	R0, R0
BL	_SendCharInterrupt+0
;uart.c,247 :: 		}
L_translate46:
;uart.c,248 :: 		clearLetter();
BL	_clearLetter+0
;uart.c,250 :: 		}
L_end_translate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _translate
_fnc:
;uart.c,252 :: 		void fnc(char DD){
; DD start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; DD end address is: 0 (R0)
; DD start address is: 0 (R0)
;uart.c,254 :: 		if(DD == SPACE){
CMP	R0, #35
IT	NE
BNE	L_fnc47
;uart.c,255 :: 		LCD_CLEAR_SCREEN();
STRB	R0, [SP, #4]
BL	_LCD_CLEAR_SCREEN+0
LDRB	R0, [SP, #4]
;uart.c,256 :: 		LCD_PRINT_CHAR(DD);
; DD end address is: 0 (R0)
BL	_LCD_PRINT_CHAR+0
;uart.c,257 :: 		SendCharInterrupt(' ');
MOVS	R0, #32
SXTH	R0, R0
BL	_SendCharInterrupt+0
;uart.c,258 :: 		clearLetter();
BL	_clearLetter+0
;uart.c,259 :: 		}
IT	AL
BAL	L_fnc48
L_fnc47:
;uart.c,261 :: 		LCD_PRINT_CHAR(DD);
; DD start address is: 0 (R0)
STRB	R0, [SP, #4]
BL	_LCD_PRINT_CHAR+0
LDRB	R0, [SP, #4]
;uart.c,263 :: 		letter[letter_cnt++] = DD;
MOVW	R1, #lo_addr(_letter_cnt+0)
MOVT	R1, #hi_addr(_letter_cnt+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_letter+0)
MOVT	R1, #hi_addr(_letter+0)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
; DD end address is: 0 (R0)
MOVW	R1, #lo_addr(_letter_cnt+0)
MOVT	R1, #hi_addr(_letter_cnt+0)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_letter_cnt+0)
MOVT	R1, #hi_addr(_letter_cnt+0)
STRH	R2, [R1, #0]
;uart.c,264 :: 		if(letter_cnt == 5)
MOVW	R1, #lo_addr(_letter_cnt+0)
MOVT	R1, #hi_addr(_letter_cnt+0)
LDRH	R1, [R1, #0]
CMP	R1, #5
IT	NE
BNE	L_fnc49
;uart.c,265 :: 		translate();
BL	_translate+0
L_fnc49:
;uart.c,266 :: 		}
L_fnc48:
;uart.c,268 :: 		}
L_end_fnc:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _fnc
uart____?ag:
L_end_uart___?ag:
BX	LR
; end of uart____?ag
