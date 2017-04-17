#include "uart.h"
#include "lcd.h"
#include "led.h"


// LEDs
volatile sbit LED_1 at GPIOE_ODR.B12;
volatile sbit LED_2 at GPIOE_ODR.B15;

extern volatile char uart_rd;
extern volatile char uart_tr;

// Variables and Buffers for UART
extern volatile char letter[6] ;
extern volatile char letters[100][6];
extern volatile unsigned letter_cnt;
extern volatile unsigned int letters_cnt;
extern volatile char word[50] ;


 void init_UART_pins(){


    RCC_AHB1ENR    |=  (1UL << UART4_TX_PORT);      // Enable clock for port A TX
    //  RCC_AHB1ENR    |=  (1UL << UART4_RX_PORT);      // Enable clock for port A RX
    RCC_APB1ENR    |=   (1UL << 19);      // Enable UART4 Clock
    
    init_GPIO_Pin(MODER,   UART4_TX_PORT, UART4_TX_PIN, ALTERNATIVE_FUNCTION);
    init_GPIO_Pin(MODER,   UART4_RX_PORT, UART4_RX_PIN, ALTERNATIVE_FUNCTION);
    
    init_GPIO_Pin(OTYPER,  UART4_TX_PORT, UART4_TX_PIN, PUSH_PULL);
    init_GPIO_Pin(OTYPER,  UART4_RX_PORT, UART4_RX_PIN, PUSH_PULL);
    
    init_GPIO_Pin(OSPEEDR, UART4_TX_PORT, UART4_TX_PIN, HIGH);
    init_GPIO_Pin(OSPEEDR, UART4_RX_PORT, UART4_RX_PIN, HIGH);
    
    init_GPIO_Pin(PUPDR, UART4_TX_PORT, UART4_TX_PIN, PULL_UP);
    init_GPIO_Pin(PUPDR, UART4_RX_PORT, UART4_RX_PIN, PULL_UP);



    GPIOA_AFRL     &= ~(15UL << 0);       // Clear Alternative Function
    GPIOA_AFRL     &= ~(15UL << 4);       // Clear Alternative Function
    GPIOA_AFRL     |=  (8UL << 0);        // Set Alternative Function 8 (low registar)
    GPIOA_AFRL     |=  (8UL << 4);        // Set Alternative Function 8 (low registar)

}
/*
void init_UART_pins_2(){


    RCC_AHB1ENR    |=  ((1UL << 0));      // Enable clock for port A
    RCC_APB1ENR    |=   (1UL << 19);      // Enable UART4 Clock

    GPIOA_MODER    &= ~((3UL << 2*0));    // Clear bits for MODER (mode register)
    GPIOA_MODER    &= ~((3UL << 2*1));    // Clear bits for MODER (mode register)
    GPIOA_MODER    |=   (2UL << 2*0);     // Setup TX pin for Alternate Function
    GPIOA_MODER    |=   (2UL << 2*1);     // Setup RX pin for Alternate Function

    GPIOA_OTYPER   &= ~((1UL << 0));      // output type register: Output push-pull  (just one bit)
    GPIOA_OTYPER   &= ~((1UL << 1));      // output type register: Output push-pull  (just one bit)

    GPIOA_OSPEEDR  &= ~((3UL << 2*0));    // Clear bits for OSPEEDR (output speed register)
    GPIOA_OSPEEDR  &= ~((3UL << 2*1));    // Clear bits for OSPEEDR (output speed register)
    GPIOA_OSPEEDR  |=  ((3UL << 2*0));    // Set 50MHz (11h)
    GPIOA_OSPEEDR  |=  ((3UL << 2*1));    // Set 50MHz

    GPIOA_PUPDR    &= ~((3UL << 2*0));    // Clear bits for pupdr (pull-up/pull-down register)
    GPIOA_PUPDR    &= ~((3UL << 2*1));    // Clear bits for pupdr (pull-up/pull-down register)
    GPIOA_PUPDR    |=   (1UL << 2*0);     // Set Pull-up   (1h = 01b)
    GPIOA_PUPDR    |=   (1UL << 2*1);     // Set Pull-up   (1h = 01b)

    GPIOA_AFRL     &= ~(15UL << 0);       // Clear Alternative Function
    GPIOA_AFRL     &= ~(15UL << 4);       // Clear Alternative Function
    GPIOA_AFRL     |=  (8UL << 0);        // Set Alternative Function 8 (low registar)
    GPIOA_AFRL     |=  (8UL << 4);        // Set Alternative Function 8 (low registar)

}    */

void init_UART(){
    init_UART_pins();

    /**************************************************************
    *    Calculating Mantisa and Div                              *
    *    MANTISA 11:0 (15:4) FRACTION 3:0                         *
    *    Tx/Rx baud = fck / (8*2* USARTDIV)                       *
    *    Tx/Rx baud = 9600                                        *
    *    fck = 16000000 (16Mhz)                                   *
    *    USARTDIV = 104.17                                        *
    *    DIV_Fraction = 16 * 0.17 = 2.73  -> nearest(2.73) = 3h   *
    *    MANTISA = 104 = 68h                                      *
    *    BRR = 683h                                               *
    ***************************************************************/
    UART4_BRR = 0x00000682;
    
    init_UART4_Register(CR1, WORD_LENGTH, WORD_8B);
    init_UART4_Register(CR1, PARITY, PARITY_DISABLE);

    init_UART4_Register(CR1, UART_RECEIVE, UART_RX_ON);
    init_UART4_Register(CR1, UART_TRANSMIT, UART_TX_ON);

    init_UART4_Register(CR1, UART_RX_INTERRUPT,UART_RX_INTERRUPT_ON);


    NVIC_IntEnable(IVT_INT_UART4);        // TODO change this!

    init_UART4_Register(CR1, UART4_ED,UART4_ENABLE);
}


void init_UART_2(){
    init_UART_pins();

    /**************************************************************
    *    Calculating Mantisa and Div                              *
    *    MANTISA 11:0 (15:4) FRACTION 3:0                         *
    *    Tx/Rx baud = fck / (8*2* USARTDIV)                       *
    *    Tx/Rx baud = 9600                                        *
    *    fck = 16000000 (16Mhz)                                   *
    *    USARTDIV = 104.17                                        *
    *    DIV_Fraction = 16 * 0.17 = 2.73  -> nearest(2.73) = 3h   *
    *    MANTISA = 104 = 68h                                      *
    *    BRR = 683h                                               *
    ***************************************************************/
    UART4_BRR = 0x00000682;

    UART4_CR1    &= ~(1UL << 12);         // M = 0 => Word lenght = 8b
    UART4_CR1    &= ~(1UL << 10);         // parity disable

    UART4_CR1    |= (1UL << 2);           // Receiver enable    (RE)
    UART4_CR1    |= (1UL << 3);           // Transmitter enable (TE)


    UART4_CR1    |= (1UL << UART_RX_INTERRUPT);           // RXE interrupt enable - interrupt is generated whenever ORE=1 or RXNE=1 in the USART_SR register


    NVIC_IntEnable(IVT_INT_UART4);        // TODO change this!

    UART4_CR1 |= (1UL << 13);             // Enable UART
}





void SendCharInterrupt (int ch)  {
    uart_tr = ch;
    UART4_CR1 |= (1UL << UART_TX_INTERRUPT);              // Enable intrrupt (TXEIE)
    Delay_ms(1);
}

void SendStringInterrupt(char *s){
    while(*s){
        SendCharInterrupt(*s);
        s++;
    }
}


int charToInt(char c){
     if( c >= 48 && c <= 57)
           return c - 48;
     else if ((c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
         if(c >= 97 && c <= 122)
             c -= 'a'-'A';
             return c - 55;
     }
     else return -1;
}

void LED_char_translate(char c){
     LED_1 = 1;
     if(c == DOT) Delay_ms(ONE_SECOND_DASH);
     else         Delay_ms(3*ONE_SECOND_DASH);
     LED_1 = 0;
     Delay_ms(ONE_SECOND_DASH);
}

void LED_string_translate(char *s){
     while(*s){
         LED_char_translate(*s);
         s++;
        // Delay_ms(ONE_SECOND_DOT);
     }
}

int convert(char c){
    if(charToInt(c) == -1) strcpy(letter, "!");
    else{
       strcpy(letter, alpha[charToInt(c)]);

    }
}

void convertString(char *s){
    strcpy(word, "");
    while(*s){
       convert(*s);
       strcat(word, letter);
       strcat(word, " ");
       s++;
    }
}


// Find letter from Dot and Dashes!!!
int findLetter(){
    int i;
    for(i = 0; i < ALPHABET_SIZE; i++){
        if(strcmp(letter, alpha[i]) == 0)
            return i;
    }
    return -1;
}

char intToChar(int i){
     if( i >= 0 && i <= 9)
         return 48 + i;
      else if ( i < ALPHABET_SIZE)
         return 55 + i;
     return '!';
}

void clearLetter(){
    int i;
    for(i = 0; i < 6; letter[i++] = '\0');
    letter_cnt = 0;
}


void translate(){

      int temp;
      //LCD_CLEAR_SCREEN();
      letter[letter_cnt + 1] = '\0';
      temp = findLetter();

      LCD_PRINT_STRING(" = ");
      if(temp != -1){
          strcpy(letters[letters_cnt++] ,letter);
          LCD_PRINT_CHAR(intToChar(temp));
          SendCharInterrupt(intToChar(temp));

      } else{                            //ERROR not found this sequence of dots and dashes
              LCD_PRINT_STRING('!');
              SendCharInterrupt('!');
      }
      clearLetter();

}

void fnc(char DD){

     if(DD == SPACE){
         LCD_CLEAR_SCREEN();
         LCD_PRINT_CHAR(DD);
         SendCharInterrupt(' ');
         clearLetter();
     }
     else{
         LCD_PRINT_CHAR(DD);
         //LED_1 = DD == DOT ? 0 : 1;
         letter[letter_cnt++] = DD;
         if(letter_cnt == 5)
             translate();
     }

}