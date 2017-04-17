#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/led.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 8 "c:/users/lazar.vasic/desktop/mips/led.h"
void init_LEDs();
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
#line 1 "c:/users/lazar.vasic/desktop/mips/button.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 9 "c:/users/lazar.vasic/desktop/mips/button.h"
void init_Buttons();
#line 1 "c:/users/lazar.vasic/desktop/mips/lcd.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
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
#line 1 "c:/users/lazar.vasic/desktop/mips/timers.h"
#line 18 "c:/users/lazar.vasic/desktop/mips/timers.h"
extern volatile int currentTime;




void init_Timer2();
#line 11 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
volatile sbit LED_11 at  GPIOE_ODR.B12 ;
volatile sbit LED_22 at  GPIOE_ODR.B15 ;
#line 29 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
volatile sbit LCD_RS at  GPIOC_ODR.B4 ;
volatile sbit LCD_EN at  GPIOC_ODR.B13 ;

volatile sbit LCD_D4 at  GPIOC_ODR.B3 ;
volatile sbit LCD_D5 at  GPIOC_ODR.B2 ;
volatile sbit LCD_D6 at  GPIOC_ODR.B1 ;
volatile sbit LCD_D7 at  GPIOC_ODR.B0 ;





volatile char letter[6] ;
volatile char letters[100][6];
volatile unsigned letter_cnt;
volatile unsigned int letters_cnt;
volatile char word[50] ;


volatile unsigned currentTime = 0;
volatile unsigned confirmTime = 0;
volatile unsigned riseTimeB1 = 0;
volatile unsigned fallTimeB1 = 0;
volatile unsigned riseTimeB2 = 0;
volatile unsigned fallTimeB2 = 0;

volatile int canTranslate = 0;

volatile char time[3];

volatile char uart_rd;
volatile char uart_tr;

volatile unsigned dashTime =  3 * 2 ;
volatile unsigned dotTime =  2 ;
volatile unsigned spaceTime = 7 *  2 ;
#line 77 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
 void init_all(){
#line 83 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
 RCC_APB2ENR |= (1 << 14);

 init_LEDs();
 init_Buttons();
 init_UART();
 init_Lcd();
 init_Timer2();

}



void doSomething(){
 while(1) {
 asm WFI;
 }
}



void main(){

 init_all();
 Delay_ms(10);

 doSomething();

}

void ChangeDashTime(){
 LCD_CURSOR(1,9);
 LCD_PRINT_STRING("SPEED:");
 switch(dashTime){
 case  3 * 1 :
 dotTime =  2 ;
 dashTime =  3 * 2 ;
 LCD_PRINT_CHAR('1');
 break;
 case  3 * 2 :
 dotTime =  3 ;
 dashTime =  3 * 3 ;
 LCD_PRINT_CHAR('2');
 break;
 case  3 * 3 :
 dotTime =  4 ;
 dashTime =  3 * 4 ;
 LCD_PRINT_CHAR('3');
 break;
 case  3 * 4 :
 dotTime =  1 ;
 dashTime =  3 * 1 ;
 LCD_PRINT_CHAR('4');
 break;
 }
 spaceTime = 7*dotTime;
 LCD_CURSOR(0,0);
}




void Button1_Interrupt() iv IVT_INT_EXTI0 {

 if( EXTI_FTSR & (1UL <<  0 )){
 LED_11 = 1;
 riseTimeB1 = currentTime;
 EXTI_FTSR &= ~(1UL <<  0 );
 EXTI_RTSR |= 1UL <<  0 ;
 }
 else if ( EXTI_RTSR & (1UL <<  0 )){
 LED_11 = 0;
 if(letter_cnt == 0) LCD_CLEAR_SCREEN();
 fallTimeB1 = currentTime;
 EXTI_RTSR &= ~(1UL <<  0 );
 EXTI_FTSR |= 1UL <<  0 ;

 canTranslate = 1;
 fnc(((fallTimeB1 - riseTimeB1 < dashTime) ?  '.'  :  '-' ));

 spaceTime = 7 * dotTime;

 }

 EXTI_PR = 0x01;
 EXTI_IMR |= 1;
}


void Button2_Interrupt() iv IVT_INT_EXTI15_10 {

 if( EXTI_FTSR & (1UL <<  10 )){
 if(letter_cnt == 0) LCD_CLEAR_SCREEN();
 riseTimeB2 = currentTime;
 EXTI_FTSR &= ~(1UL <<  10 );
 EXTI_RTSR |= (1UL <<  10 );
 }else if ( EXTI_RTSR & (1UL <<  10 )){
 fallTimeB2 = currentTime;
 EXTI_RTSR &= ~(1UL <<  10 );
 EXTI_FTSR |= (1 <<  10 );

 if(fallTimeB2 - riseTimeB2 <  200 ){
 ChangeDashTime();
 }else {
 LCD_CLEAR_SCREEN();
 LED_11 = LED_22 = 0;

 }

 }

 EXTI_PR = (0x01 << 10);
 EXTI_IMR |= (1 << 10);
}


void UART_Interrupt() iv IVT_INT_UART4 {

 if(UART4_SR & 0x20){
 uart_rd = ((char)(UART4_DR & 0x01FF));
 LCD_CLEAR_SCREEN();
 LCD_PRINT_CHAR(uart_rd);
 LCD_PRINT_STRING(" -> ");
 convert(uart_rd);
 LCD_PRINT_STRING(letter);
 LED_string_translate(letter);

 EXTI_PR = (1UL <<  1 );
 EXTI_IMR |= (1UL <<  1 );

 }
 else if( UART4_SR & 0x80){
 UART4_CR1 &= ~(1UL <<  7UL );
 UART4_DR = (uart_tr & 0x01FF);
 EXTI_PR = (1UL <<  0 );
 EXTI_IMR |= (1UL <<  0 );
 }
 UART4_CR1 |= (1UL << 13);

}


void Timer2_Interrupt() iv IVT_INT_TIM2 {

 if(TIM2_SR){
 currentTime++;
 TIM2_SR = 0x00;


 if(canTranslate == 1)
 confirmTime++;
 else
 spaceTime--;

 if(confirmTime ==  25 ){

 translate();
 confirmTime = canTranslate = 0;
 spaceTime =  7*dotTime ;
 }
 if(spaceTime == 0)
 fnc( '#' );

 }

}
