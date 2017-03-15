#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/uart.h"










static const char *alpha[] = {
 "-----",
 ".----",
 "..---",
 "...--",
 "....-",
 ".....",
 "-....",
 "--...",
 "---..",
 "----.",
 ".-",
 "-...",
 "-.-.",
 "-..",
 ".",
 "..-.",
 "--.",
 "....",
 "..",
 ".---",
 "-.-",
 ".-..",
 "--",
 "-.",
 "---",
 ".--.",
 "--.-",
 ".-.",
 "...",
 "-",
 "..-",
 "...-",
 ".--",
 "-..-",
 "-.--",
 "--..",
};



void init_UART_pins();

void init_UART();


void SendCharInterrupt (int ch) ;

void SendStringInterrupt(char *s);

int charToInt(char c);

int convert(char c);

void convertString(char *s);

int findLetter();

char intToChar(int i);

void clearLetter();

void translate();

void fnc(char DD);
#line 1 "c:/users/lazar.vasic/desktop/mips/lcd.h"
#line 21 "c:/users/lazar.vasic/desktop/mips/lcd.h"
void set_lcd_en() ;
void clear_lcd_en();

void set_lcd_rs() ;
void clear_lcd_rs();

void set_lcd_d4() ;
void clear_lcd_d4();

void set_lcd_d5() ;
void clear_lcd_d5();

void set_lcd_d6() ;
void clear_lcd_d6();

void set_lcd_d7() ;
void clear_lcd_d7();



void lcd_gpio_init();

void lcd_data_line_write(char d);

void lcd_Control_Write(char d);

void lcd_Data_Write(char d);

void init_Lcd();




void LCD_CURSOR(char x, char y);

void LCD_CURSOR_HOME(void);

void LCD_CURSOR_OFFF();

void LCD_CURSOR_ONN();

void LCD_CURSOR_ALLL();

void LCD_CURSOR_BLINKK();

void LCD_CLEAR_SCREEN(void);

void LCD_RIGHT_SHIFT(void);

void LCD_LEFT_SHIFT(void);

void LCD_PRINT_STRING(char* d);

void LCD_PRINT_CHAR(char d);
#line 1 "c:/users/lazar.vasic/desktop/mips/led.h"





void init_LEDs();
#line 6 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
extern volatile char uart_rd;
extern volatile char uart_tr;


volatile sbit LED_1 at GPIOE_ODR.B12;
volatile sbit LED_2 at GPIOE_ODR.B15;



extern volatile char letter[6] ;
extern volatile char letters[100][6];
extern volatile unsigned letter_cnt;
extern volatile unsigned int letters_cnt;
extern volatile char word[50] ;


void init_UART_pins(){


 RCC_AHB1ENR |= ((1UL << 0));
 RCC_APB1ENR |= (1UL << 19);

 GPIOA_MODER &= ~((3UL << 2*0));
 GPIOA_MODER &= ~((3UL << 2*1));
 GPIOA_MODER |= (2UL << 2*0);
 GPIOA_MODER |= (2UL << 2*1);

 GPIOA_OTYPER &= ~((1UL << 0));
 GPIOA_OTYPER &= ~((1UL << 1));

 GPIOA_OSPEEDR &= ~((3UL << 2*0));
 GPIOA_OSPEEDR &= ~((3UL << 2*1));
 GPIOA_OSPEEDR |= ((3UL << 2*0));
 GPIOA_OSPEEDR |= ((3UL << 2*1));

 GPIOA_PUPDR &= ~((3UL << 2*0));
 GPIOA_PUPDR &= ~((3UL << 2*1));
 GPIOA_PUPDR |= (1UL << 2*0);
 GPIOA_PUPDR |= (1UL << 2*1);

 GPIOA_AFRL &= ~(15UL << 0);
 GPIOA_AFRL &= ~(15UL << 4);
 GPIOA_AFRL |= (8UL << 0);
 GPIOA_AFRL |= (8UL << 4);

}


void init_UART(){
 init_UART_pins();
#line 68 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
 UART4_BRR = 0x00000682;

 UART4_CR1 &= ~(1UL << 12);
 UART4_CR1 &= ~(1UL << 10);

 UART4_CR1 |= (1UL << 2);
 UART4_CR1 |= (1UL << 3);


 UART4_CR1 |= (1UL << 5);


 NVIC_IntEnable(IVT_INT_UART4);

 UART4_CR1 |= (1UL << 13);
}





void SendCharInterrupt (int ch) {
 uart_tr = ch;
 UART4_CR1 |= (1UL << 7);
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

int convert(char c){
 if(charToInt(c) == -1) strcpy(letter, "!");
 else strcpy(letter, alpha[charToInt(c)]);
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



int findLetter(){
 int i;
 for(i = 0; i <  36 ; i++){
 if(strcmp(letter, alpha[i]) == 0)
 return i;
 }
 return -1;
}

char intToChar(int i){
 if( i >= 0 && i <= 9)
 return 48 + i;
 else if ( i <  36 )
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

 letter[letter_cnt + 1] = '\0';
 temp = findLetter();

 LCD_PRINT_STRING(" = ");
 if(temp != -1){
 strcpy(letters[letters_cnt++] ,letter);
 LCD_PRINT_CHAR(intToChar(temp));
 SendCharInterrupt(intToChar(temp));

 } else{
 LCD_PRINT_STRING('!');
 SendCharInterrupt('!');
 }
 clearLetter();


}

void fnc(char DD){
 LED_2 = 1;
 LED_1 = DD ==  '.'  ? 0 : 1;
 LCD_PRINT_CHAR(DD);
 letter[letter_cnt++] = DD;
 if(letter_cnt == 5)
 translate();
}
