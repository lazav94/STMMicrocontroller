#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/uart.h"
#line 60 "c:/users/lazar.vasic/desktop/mips/uart.h"
extern unsigned dotTime;
extern unsigned dashTime;


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
void init_UART_pins_2();

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

void LED_char_translate(char c);

void LED_string_translate(char *s);
#line 1 "c:/users/lazar.vasic/desktop/mips/lcd.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 24 "c:/users/lazar.vasic/desktop/mips/lcd.h"
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
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 8 "c:/users/lazar.vasic/desktop/mips/led.h"
void init_LEDs();
#line 7 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
volatile sbit LED_1 at GPIOE_ODR.B12;
volatile sbit LED_2 at GPIOE_ODR.B15;

extern volatile char uart_rd;
extern volatile char uart_tr;


extern volatile char letter[6] ;
extern volatile char letters[100][6];
extern volatile unsigned letter_cnt;
extern volatile unsigned int letters_cnt;
extern volatile char word[50] ;


 void init_UART_pins(){


 RCC_AHB1ENR |= (1UL <<  0 );

 RCC_APB1ENR |= (1UL << 19);

 init_GPIO_Pin( 0 ,  0 ,  0 ,  2UL );
 init_GPIO_Pin( 0 ,  0 ,  1 ,  2UL );

 init_GPIO_Pin( 1 ,  0 ,  0 ,  0UL );
 init_GPIO_Pin( 1 ,  0 ,  1 ,  0UL );

 init_GPIO_Pin( 2 ,  0 ,  0 ,  2UL );
 init_GPIO_Pin( 2 ,  0 ,  1 ,  2UL );

 init_GPIO_Pin( 3 ,  0 ,  0 ,  1UL );
 init_GPIO_Pin( 3 ,  0 ,  1 ,  1UL );



 GPIOA_AFRL &= ~(15UL << 0);
 GPIOA_AFRL &= ~(15UL << 4);
 GPIOA_AFRL |= (8UL << 0);
 GPIOA_AFRL |= (8UL << 4);

}
#line 80 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
void init_UART(){
 init_UART_pins();
#line 94 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
 UART4_BRR = 0x00000682;

 init_UART4_Register( 1 ,  12 ,  0UL );
 init_UART4_Register( 1 ,  10 ,  0UL );

 init_UART4_Register( 1 ,  2UL ,  1UL );
 init_UART4_Register( 1 ,  3UL ,  1UL );

 init_UART4_Register( 1 ,  5UL , 1UL );


 NVIC_IntEnable(IVT_INT_UART4);

 init_UART4_Register( 1 ,  13UL , 1UL );
}


void init_UART_2(){
 init_UART_pins();
#line 125 "C:/Users/Lazar.Vasic/Desktop/MIPS/uart.c"
 UART4_BRR = 0x00000682;

 UART4_CR1 &= ~(1UL << 12);
 UART4_CR1 &= ~(1UL << 10);

 UART4_CR1 |= (1UL << 2);
 UART4_CR1 |= (1UL << 3);


 UART4_CR1 |= (1UL <<  5UL );


 NVIC_IntEnable(IVT_INT_UART4);

 UART4_CR1 |= (1UL << 13);
}





void SendCharInterrupt (int ch) {
 uart_tr = ch;
 UART4_CR1 |= (1UL <<  7UL );
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
 if(c ==  '.' ) Delay_ms( 3 * 3 );
 else Delay_ms(3* 3 * 3 );
 LED_1 = 0;
 Delay_ms( 3 * 3 );
}

void LED_string_translate(char *s){
 while(*s){
 LED_char_translate(*s);
 s++;

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

 if(DD ==  '#' ){
 LCD_CLEAR_SCREEN();
 LCD_PRINT_CHAR(DD);
 SendCharInterrupt(' ');
 clearLetter();
 }
 else{
 LCD_PRINT_CHAR(DD);

 letter[letter_cnt++] = DD;
 if(letter_cnt == 5)
 translate();
 }

}
