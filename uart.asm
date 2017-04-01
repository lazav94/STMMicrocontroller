_init_UART_pins:
;uart.c,21 :: 		void init_UART_pins(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,24 :: 		RCC_AHB1ENR    |=  ((1UL << 0));      // Enable clock for port A
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,25 :: 		RCC_APB1ENR    |=   (1UL << 19);      // Enable UART4 Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,27 :: 		init_GPIO_Pin(MODER,   UART4_TX_PORT, UART4_TX_PIN, ALTERNATIVE_FUNCTION);
MOV	R3, #2
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;uart.c,28 :: 		init_GPIO_Pin(MODER,   UART4_RX_PORT, UART4_RX_PIN, ALTERNATIVE_FUNCTION);
MOV	R3, #2
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_init_GPIO_Pin+0
;uart.c,30 :: 		init_GPIO_Pin(OTYPER,  UART4_TX_PORT, UART4_TX_PIN, PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;uart.c,31 :: 		init_GPIO_Pin(OTYPER,  UART4_RX_PORT, UART4_RX_PIN, PUSH_PULL);
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #1
BL	_init_GPIO_Pin+0
;uart.c,33 :: 		init_GPIO_Pin(OSPEEDR, UART4_TX_PORT, UART4_TX_PIN, HIGH);
MOVS	R3, #2
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;uart.c,34 :: 		init_GPIO_Pin(OSPEEDR, UART4_RX_PORT, UART4_RX_PIN, HIGH);
MOVS	R3, #2
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #2
BL	_init_GPIO_Pin+0
;uart.c,36 :: 		init_GPIO_Pin(PUPDR, UART4_TX_PORT, UART4_TX_PIN, PULL_UP);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;uart.c,37 :: 		init_GPIO_Pin(PUPDR, UART4_RX_PORT, UART4_RX_PIN, PULL_UP);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #3
BL	_init_GPIO_Pin+0
;uart.c,41 :: 		GPIOA_AFRL     &= ~(15UL << 0);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,42 :: 		GPIOA_AFRL     &= ~(15UL << 4);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,43 :: 		GPIOA_AFRL     |=  (8UL << 0);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,44 :: 		GPIOA_AFRL     |=  (8UL << 4);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,46 :: 		}
L_end_init_UART_pins:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART_pins
_init_UART_pins_2:
;uart.c,48 :: 		void init_UART_pins_2(){
;uart.c,51 :: 		RCC_AHB1ENR    |=  ((1UL << 0));      // Enable clock for port A
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_AHB1ENR+0)
MOVT	R0, #hi_addr(RCC_AHB1ENR+0)
STR	R1, [R0, #0]
;uart.c,52 :: 		RCC_APB1ENR    |=   (1UL << 19);      // Enable UART4 Clock
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;uart.c,54 :: 		GPIOA_MODER    &= ~((3UL << 2*0));    // Clear bits for MODER (mode register)
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;uart.c,55 :: 		GPIOA_MODER    &= ~((3UL << 2*1));    // Clear bits for MODER (mode register)
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;uart.c,56 :: 		GPIOA_MODER    |=   (2UL << 2*0);     // Setup TX pin for Alternate Function
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;uart.c,57 :: 		GPIOA_MODER    |=   (2UL << 2*1);     // Setup RX pin for Alternate Function
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
;uart.c,59 :: 		GPIOA_OTYPER   &= ~((1UL << 0));      // output type register: Output push-pull  (just one bit)
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
;uart.c,60 :: 		GPIOA_OTYPER   &= ~((1UL << 1));      // output type register: Output push-pull  (just one bit)
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
;uart.c,62 :: 		GPIOA_OSPEEDR  &= ~((3UL << 2*0));    // Clear bits for OSPEEDR (output speed register)
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,63 :: 		GPIOA_OSPEEDR  &= ~((3UL << 2*1));    // Clear bits for OSPEEDR (output speed register)
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,64 :: 		GPIOA_OSPEEDR  |=  ((3UL << 2*0));    // Set 50MHz (11h)
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,65 :: 		GPIOA_OSPEEDR  |=  ((3UL << 2*1));    // Set 50MHz
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
;uart.c,67 :: 		GPIOA_PUPDR    &= ~((3UL << 2*0));    // Clear bits for pupdr (pull-up/pull-down register)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;uart.c,68 :: 		GPIOA_PUPDR    &= ~((3UL << 2*1));    // Clear bits for pupdr (pull-up/pull-down register)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;uart.c,69 :: 		GPIOA_PUPDR    |=   (1UL << 2*0);     // Set Pull-up   (1h = 01b)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;uart.c,70 :: 		GPIOA_PUPDR    |=   (1UL << 2*1);     // Set Pull-up   (1h = 01b)
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;uart.c,72 :: 		GPIOA_AFRL     &= ~(15UL << 0);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,73 :: 		GPIOA_AFRL     &= ~(15UL << 4);       // Clear Alternative Function
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,74 :: 		GPIOA_AFRL     |=  (8UL << 0);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,75 :: 		GPIOA_AFRL     |=  (8UL << 4);        // Set Alternative Function 8 (low registar)
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
;uart.c,77 :: 		}
L_end_init_UART_pins_2:
BX	LR
; end of _init_UART_pins_2
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
;uart.c,96 :: 		UART4_CR1    &= ~(1UL << 12);         // M = 0 => Word lenght = 8b
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,97 :: 		UART4_CR1    &= ~(1UL << 10);         // parity disable
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,99 :: 		UART4_CR1    |= (1UL << 2);           // Receiver enable    (RE)
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,100 :: 		UART4_CR1    |= (1UL << 3);           // Transmitter enable (TE)
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,103 :: 		UART4_CR1    |= (1UL << 5);           // RXE interrupt enable - interrupt is generated whenever ORE=1 or RXNE=1 in the USART_SR register
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,106 :: 		NVIC_IntEnable(IVT_INT_UART4);        // TODO change this!
MOVW	R0, #68
BL	_NVIC_IntEnable+0
;uart.c,108 :: 		UART4_CR1 |= (1UL << 13);             // Enable UART
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(UART4_CR1+0)
MOVT	R0, #hi_addr(UART4_CR1+0)
STR	R1, [R0, #0]
;uart.c,109 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_SendCharInterrupt:
;uart.c,115 :: 		void SendCharInterrupt (int ch)  {
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;uart.c,116 :: 		uart_tr = ch;
MOVW	R1, #lo_addr(_uart_tr+0)
MOVT	R1, #hi_addr(_uart_tr+0)
STRB	R0, [R1, #0]
; ch end address is: 0 (R0)
;uart.c,117 :: 		UART4_CR1 |= (1UL << 7);              // Enable intrrupt (TXEIE)
MOVW	R1, #lo_addr(UART4_CR1+0)
MOVT	R1, #hi_addr(UART4_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #128
MOVW	R1, #lo_addr(UART4_CR1+0)
MOVT	R1, #hi_addr(UART4_CR1+0)
STR	R2, [R1, #0]
;uart.c,118 :: 		Delay_ms(1);
MOVW	R7, #10665
MOVT	R7, #0
NOP
NOP
L_SendCharInterrupt0:
SUBS	R7, R7, #1
BNE	L_SendCharInterrupt0
NOP
NOP
;uart.c,119 :: 		}
L_end_SendCharInterrupt:
BX	LR
; end of _SendCharInterrupt
_SendStringInterrupt:
;uart.c,121 :: 		void SendStringInterrupt(char *s){
; s start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
MOV	R3, R0
; s end address is: 0 (R0)
;uart.c,122 :: 		while(*s){
L_SendStringInterrupt2:
; s start address is: 12 (R3)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_SendStringInterrupt3
;uart.c,123 :: 		SendCharInterrupt(*s);
LDRB	R1, [R3, #0]
SXTH	R0, R1
BL	_SendCharInterrupt+0
;uart.c,124 :: 		s++;
ADDS	R3, R3, #1
;uart.c,125 :: 		}
; s end address is: 12 (R3)
IT	AL
BAL	L_SendStringInterrupt2
L_SendStringInterrupt3:
;uart.c,126 :: 		}
L_end_SendStringInterrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SendStringInterrupt
_charToInt:
;uart.c,129 :: 		int charToInt(char c){
; c start address is: 0 (R0)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
;uart.c,130 :: 		if( c >= 48 && c <= 57)
CMP	R0, #48
IT	CC
BCC	L__charToInt46
CMP	R0, #57
IT	HI
BHI	L__charToInt45
L__charToInt44:
;uart.c,131 :: 		return c - 48;
SUBW	R1, R0, #48
; c end address is: 0 (R0)
SXTH	R0, R1
IT	AL
BAL	L_end_charToInt
;uart.c,130 :: 		if( c >= 48 && c <= 57)
L__charToInt46:
; c start address is: 0 (R0)
L__charToInt45:
;uart.c,132 :: 		else if ((c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
CMP	R0, #65
IT	CC
BCC	L__charToInt48
CMP	R0, #90
IT	HI
BHI	L__charToInt47
IT	AL
BAL	L__charToInt41
L__charToInt48:
L__charToInt47:
CMP	R0, #97
IT	CC
BCC	L__charToInt50
CMP	R0, #122
IT	HI
BHI	L__charToInt49
IT	AL
BAL	L__charToInt41
; c end address is: 0 (R0)
L__charToInt50:
L__charToInt49:
IT	AL
BAL	L_charToInt14
L__charToInt41:
;uart.c,133 :: 		if(c >= 97 && c <= 122)
; c start address is: 0 (R0)
CMP	R0, #97
IT	CC
BCC	L__charToInt53
CMP	R0, #122
IT	HI
BHI	L__charToInt54
L__charToInt40:
;uart.c,134 :: 		c -= 'a'-'A';
SUBW	R1, R0, #32
UXTB	R0, R1
; c end address is: 0 (R0)
;uart.c,133 :: 		if(c >= 97 && c <= 122)
IT	AL
BAL	L__charToInt52
L__charToInt53:
L__charToInt52:
; c start address is: 0 (R0)
; c end address is: 0 (R0)
IT	AL
BAL	L__charToInt51
L__charToInt54:
L__charToInt51:
;uart.c,135 :: 		return c - 55;
; c start address is: 0 (R0)
SUBW	R1, R0, #55
; c end address is: 0 (R0)
SXTH	R0, R1
IT	AL
BAL	L_end_charToInt
;uart.c,136 :: 		}
L_charToInt14:
;uart.c,137 :: 		else return -1;
MOVW	R0, #65535
SXTH	R0, R0
;uart.c,138 :: 		}
L_end_charToInt:
BX	LR
; end of _charToInt
_convert:
;uart.c,140 :: 		int convert(char c){
; c start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; c end address is: 0 (R0)
; c start address is: 8 (R2)
;uart.c,141 :: 		if(charToInt(c) == -1) strcpy(letter, "!");
UXTB	R0, R2
BL	_charToInt+0
CMP	R0, #-1
IT	NE
BNE	L_convert19
; c end address is: 8 (R2)
MOVW	R1, #lo_addr(?lstr37_uart+0)
MOVT	R1, #hi_addr(?lstr37_uart+0)
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
BL	_strcpy+0
IT	AL
BAL	L_convert20
L_convert19:
;uart.c,142 :: 		else strcpy(letter, alpha[charToInt(c)]);
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
L_convert20:
;uart.c,143 :: 		}
L_end_convert:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _convert
_convertString:
;uart.c,145 :: 		void convertString(char *s){
; s start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
;uart.c,146 :: 		strcpy(word, "");
MOVW	R1, #lo_addr(?lstr38_uart+0)
MOVT	R1, #hi_addr(?lstr38_uart+0)
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcpy+0
; s end address is: 0 (R0)
LDR	R0, [SP, #4]
MOV	R6, R0
;uart.c,147 :: 		while(*s){
L_convertString21:
; s start address is: 24 (R6)
LDRB	R1, [R6, #0]
CMP	R1, #0
IT	EQ
BEQ	L_convertString22
;uart.c,148 :: 		convert(*s);
LDRB	R1, [R6, #0]
UXTB	R0, R1
BL	_convert+0
;uart.c,149 :: 		strcat(word, letter);
MOVW	R1, #lo_addr(_letter+0)
MOVT	R1, #hi_addr(_letter+0)
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcat+0
;uart.c,150 :: 		strcat(word, " ");
MOVW	R1, #lo_addr(?lstr39_uart+0)
MOVT	R1, #hi_addr(?lstr39_uart+0)
MOVW	R0, #lo_addr(_word+0)
MOVT	R0, #hi_addr(_word+0)
BL	_strcat+0
;uart.c,151 :: 		s++;
ADDS	R6, R6, #1
;uart.c,152 :: 		}
; s end address is: 24 (R6)
IT	AL
BAL	L_convertString21
L_convertString22:
;uart.c,153 :: 		}
L_end_convertString:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _convertString
_findLetter:
;uart.c,157 :: 		int findLetter(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,159 :: 		for(i = 0; i < ALPHABET_SIZE; i++){
; i start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; i end address is: 16 (R4)
L_findLetter23:
; i start address is: 16 (R4)
CMP	R4, #36
IT	GE
BGE	L_findLetter24
;uart.c,160 :: 		if(strcmp(letter, alpha[i]) == 0)
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
BNE	L_findLetter26
;uart.c,161 :: 		return i;
SXTH	R0, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_end_findLetter
L_findLetter26:
;uart.c,159 :: 		for(i = 0; i < ALPHABET_SIZE; i++){
; i start address is: 16 (R4)
ADDS	R4, R4, #1
SXTH	R4, R4
;uart.c,162 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_findLetter23
L_findLetter24:
;uart.c,163 :: 		return -1;
MOVW	R0, #65535
SXTH	R0, R0
;uart.c,164 :: 		}
L_end_findLetter:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _findLetter
_intToChar:
;uart.c,166 :: 		char intToChar(int i){
; i start address is: 0 (R0)
; i end address is: 0 (R0)
; i start address is: 0 (R0)
;uart.c,167 :: 		if( i >= 0 && i <= 9)
CMP	R0, #0
IT	LT
BLT	L__intToChar57
CMP	R0, #9
IT	GT
BGT	L__intToChar56
L__intToChar55:
;uart.c,168 :: 		return 48 + i;
ADDW	R1, R0, #48
; i end address is: 0 (R0)
UXTB	R0, R1
IT	AL
BAL	L_end_intToChar
;uart.c,167 :: 		if( i >= 0 && i <= 9)
L__intToChar57:
; i start address is: 0 (R0)
L__intToChar56:
;uart.c,169 :: 		else if ( i < ALPHABET_SIZE)
CMP	R0, #36
IT	GE
BGE	L_intToChar31
;uart.c,170 :: 		return 55 + i;
ADDW	R1, R0, #55
; i end address is: 0 (R0)
UXTB	R0, R1
IT	AL
BAL	L_end_intToChar
L_intToChar31:
;uart.c,171 :: 		return '!';
MOVS	R0, #33
;uart.c,172 :: 		}
L_end_intToChar:
BX	LR
; end of _intToChar
_clearLetter:
;uart.c,174 :: 		void clearLetter(){
;uart.c,176 :: 		for(i = 0; i < 6; letter[i++] = '\0');
; i start address is: 8 (R2)
MOVS	R2, #0
SXTH	R2, R2
; i end address is: 8 (R2)
L_clearLetter32:
; i start address is: 8 (R2)
CMP	R2, #6
IT	GE
BGE	L_clearLetter33
MOVW	R0, #lo_addr(_letter+0)
MOVT	R0, #hi_addr(_letter+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_clearLetter32
L_clearLetter33:
;uart.c,177 :: 		letter_cnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_letter_cnt+0)
MOVT	R0, #hi_addr(_letter_cnt+0)
STRH	R1, [R0, #0]
;uart.c,178 :: 		}
L_end_clearLetter:
BX	LR
; end of _clearLetter
_translate:
;uart.c,181 :: 		void translate(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;uart.c,184 :: 		letter[letter_cnt + 1] = '\0';
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
;uart.c,185 :: 		temp = findLetter();
BL	_findLetter+0
STRH	R0, [SP, #4]
;uart.c,187 :: 		LCD_PRINT_STRING(" = ");
MOVW	R0, #lo_addr(?lstr40_uart+0)
MOVT	R0, #hi_addr(?lstr40_uart+0)
BL	_LCD_PRINT_STRING+0
;uart.c,188 :: 		if(temp != -1){
LDRSH	R0, [SP, #4]
CMP	R0, #-1
IT	EQ
BEQ	L_translate35
;uart.c,189 :: 		strcpy(letters[letters_cnt++] ,letter);
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
;uart.c,190 :: 		LCD_PRINT_CHAR(intToChar(temp));
LDRSH	R0, [SP, #4]
BL	_intToChar+0
BL	_LCD_PRINT_CHAR+0
;uart.c,191 :: 		SendCharInterrupt(intToChar(temp));
LDRSH	R0, [SP, #4]
BL	_intToChar+0
BL	_SendCharInterrupt+0
;uart.c,193 :: 		} else{                            //ERROR not found this sequence of dots and dashes
IT	AL
BAL	L_translate36
L_translate35:
;uart.c,194 :: 		LCD_PRINT_STRING('!');
MOVS	R0, #33
BL	_LCD_PRINT_STRING+0
;uart.c,195 :: 		SendCharInterrupt('!');
MOVS	R0, #33
SXTH	R0, R0
BL	_SendCharInterrupt+0
;uart.c,196 :: 		}
L_translate36:
;uart.c,197 :: 		clearLetter();
BL	_clearLetter+0
;uart.c,200 :: 		}
L_end_translate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _translate
_fnc:
;uart.c,202 :: 		void fnc(char DD){
; DD start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; DD end address is: 0 (R0)
; DD start address is: 0 (R0)
;uart.c,203 :: 		LED_2 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;uart.c,204 :: 		LED_1 = DD == DOT ? 0 : 1;
CMP	R0, #46
IT	NE
BNE	L_fnc37
; ?FLOC___fnc?T159 start address is: 8 (R2)
MOVS	R2, #0
SXTB	R2, R2
; ?FLOC___fnc?T159 end address is: 8 (R2)
IT	AL
BAL	L_fnc38
L_fnc37:
; ?FLOC___fnc?T159 start address is: 8 (R2)
MOVS	R2, #1
SXTB	R2, R2
; ?FLOC___fnc?T159 end address is: 8 (R2)
L_fnc38:
; ?FLOC___fnc?T159 start address is: 8 (R2)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
; ?FLOC___fnc?T159 end address is: 8 (R2)
;uart.c,205 :: 		LCD_PRINT_CHAR(DD);
STRB	R0, [SP, #4]
BL	_LCD_PRINT_CHAR+0
LDRB	R0, [SP, #4]
;uart.c,206 :: 		letter[letter_cnt++] = DD;
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
;uart.c,207 :: 		if(letter_cnt == 5)
MOVW	R1, #lo_addr(_letter_cnt+0)
MOVT	R1, #hi_addr(_letter_cnt+0)
LDRH	R1, [R1, #0]
CMP	R1, #5
IT	NE
BNE	L_fnc39
;uart.c,208 :: 		translate();
BL	_translate+0
L_fnc39:
;uart.c,209 :: 		}
L_end_fnc:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _fnc
uart____?ag:
L_end_uart___?ag:
BX	LR
; end of uart____?ag
