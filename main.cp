#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/led.h"





void init_LEDs();
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
#line 1 "c:/users/lazar.vasic/desktop/mips/button.h"






void init_Buttons();
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
#line 1 "c:/users/lazar.vasic/desktop/mips/timers.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/timers.h"
extern volatile int currentTime;




void init_Timer2();
#line 12 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
extern volatile sbit LED_1;
extern volatile sbit LED_2;


volatile sbit BUTTON_1 at GPIOE_IDR.B0;
volatile sbit BUTTON_2 at GPIOA_IDR.B10;


volatile sbit LCD_RS at GPIOC_ODR.B4;
volatile sbit LCD_EN at GPIOC_ODR.B13;

volatile sbit LCD_D4 at GPIOC_ODR.B3;
volatile sbit LCD_D5 at GPIOC_ODR.B2;
volatile sbit LCD_D6 at GPIOC_ODR.B1;
volatile sbit LCD_D7 at GPIOC_ODR.B0;







volatile char letter[6] ;
volatile char letters[100][6];
volatile unsigned letter_cnt;
volatile unsigned int letters_cnt;
volatile char word[50] ;


volatile unsigned currentTime = 0;
volatile unsigned riseTimeB1 = 0;
volatile unsigned fallTimeB1 = 0;
volatile unsigned riseTimeB2 = 0;
volatile unsigned fallTimeB2 = 0;

volatile char time[3];

volatile char uart_rd;
volatile char uart_tr;
#line 80 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
 void init_all(){
#line 86 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
 RCC_APB2ENR |= (1 << 14);
 init_Lcd();
 init_Timer2();
 init_Buttons();
 init_LEDs();
 init_UART();
}

void welcome(){
 LCD_CLEAR_SCREEN();
 LCD_CURSOR(0,0);
 LCD_CURSOR_ONN();
#line 103 "C:/Users/Lazar.Vasic/Desktop/MIPS/main.c"
 LCD_CLEAR_SCREEN();
}

void doSomething(){
 while(1);
}

void main(){
 init_all();
 Delay_ms(100);
 welcome();
 doSomething();

}




void Button1_Interrupt() iv IVT_INT_EXTI0 {
 Delay_ms(10);

 if( EXTI_FTSR & (1UL)){
 riseTimeB1 = currentTime;
 EXTI_FTSR &= ~(1UL);
 EXTI_RTSR |= 1 ;
 }
 else if ( EXTI_RTSR & (1UL)){
 if(letter_cnt == 0) LCD_CLEAR_SCREEN();
 fallTimeB1 = currentTime;
 EXTI_RTSR &= ~(1UL);
 EXTI_FTSR |= 1 ;

 if(fallTimeB1 - riseTimeB1 <  2 )
 fnc( '.' );
 else
 fnc( '-' );
 } else{
 LCD_PRINT_STRING("Button1 Error");
 }

 EXTI_PR = 0x01;
 EXTI_IMR |= 1;
}


void Button2_Interrupt() iv IVT_INT_EXTI15_10 {
 Delay_ms(10);

 if( EXTI_FTSR & (1UL << 10)){
 if(letter_cnt == 0) LCD_CLEAR_SCREEN();
 riseTimeB2 = currentTime;
 EXTI_FTSR &= ~(1UL << 10);
 EXTI_RTSR |= (1 << 10);
 }else if ( EXTI_RTSR & (1UL << 10)){

 fallTimeB2 = currentTime;
 EXTI_RTSR &= ~(1UL << 10);
 EXTI_FTSR |= (1 << 10);

 if(fallTimeB2 - riseTimeB2 <  2 ){
 translate();
 }else {
 LCD_CLEAR_SCREEN();
 }

 }else
 LCD_PRINT_STRING("Button2 Error");

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
 }
 else if( UART4_SR & 0x80){
 UART4_CR1 &= ~(1UL << 7);
 UART4_DR = (uart_tr & 0x01FF);
 }

 UART4_CR1 |= (1UL << 13);

}


void Timer2_Interrupt() iv IVT_INT_TIM2 {
 if(TIM2_SR){
 currentTime++;
 TIM2_SR = 0x00;
 }else{
 LCD_PRINT_STRING("TIMER2 Error");
 }
}
