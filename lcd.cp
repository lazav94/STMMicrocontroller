#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/lcd.c"
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
#line 3 "C:/Users/Lazar.Vasic/Desktop/MIPS/lcd.c"
volatile unsigned int cursor_pos = 0;
volatile unsigned char screen_space = 0;


void set_lcd_en() { GPIOC_ODR |= (1UL << 13); }
void clear_lcd_en(){ GPIOC_ODR &=~(1UL << 13); }

void set_lcd_rs() { GPIOC_ODR |= (1UL << 4); }
void clear_lcd_rs(){ GPIOC_ODR &=~(1UL << 4); }

void set_lcd_d4() { GPIOC_ODR |= (1UL << 3); }
void clear_lcd_d4(){ GPIOC_ODR &=~(1UL << 3); }

void set_lcd_d5() { GPIOC_ODR |= (1UL << 2); }
void clear_lcd_d5(){ GPIOC_ODR &=~(1UL << 2); }

void set_lcd_d6() { GPIOC_ODR |= (1UL << 1); }
void clear_lcd_d6(){ GPIOC_ODR &=~(1UL << 1); }

void set_lcd_d7() { GPIOC_ODR |= (1UL << 0); }
void clear_lcd_d7(){ GPIOC_ODR &= ~(1UL << 0); }


void lcd_gpio_init(){


 RCC_AHB1ENR |= (1UL << 2) ;


 GPIOC_MODER &= ~(3UL << 2*13);
 GPIOC_MODER &= ~(3UL << 2*4);
 GPIOC_MODER &= ~(3UL << 2*3);
 GPIOC_MODER &= ~(3UL << 2*2);
 GPIOC_MODER &= ~(3UL << 2*1);
 GPIOC_MODER &= ~(3UL << 2*0);


 GPIOC_MODER |= (1UL << 2*13);
 GPIOC_MODER |= (1UL << 2*4);
 GPIOC_MODER |= (1UL << 2*3);
 GPIOC_MODER |= (1UL << 2*2);
 GPIOC_MODER |= (1UL << 2*1);
 GPIOC_MODER |= (1UL << 2*0);



 GPIOC_OTYPER &= ~(3UL << 13);
 GPIOC_OTYPER &= ~(3UL << 4);
 GPIOC_OTYPER &= ~(3UL << 3);
 GPIOC_OTYPER &= ~(3UL << 2);
 GPIOC_OTYPER &= ~(3UL << 1);
 GPIOC_OTYPER &= ~(3UL << 0);


 GPIOC_OSPEEDR &= ~(3UL << 2*13);
 GPIOC_OSPEEDR &= ~(3UL << 2*4);
 GPIOC_OSPEEDR &= ~(3UL << 2*3);
 GPIOC_OSPEEDR &= ~(3UL << 2*2);
 GPIOC_OSPEEDR &= ~(3UL << 2*1);
 GPIOC_OSPEEDR &= ~(3UL << 2*0);


 GPIOC_OSPEEDR |= (2UL << 2*13);
 GPIOC_OSPEEDR |= (2UL << 2*4);
 GPIOC_OSPEEDR |= (2UL << 2*3);
 GPIOC_OSPEEDR |= (2UL << 2*2);
 GPIOC_OSPEEDR |= (2UL << 2*1);
 GPIOC_OSPEEDR |= (2UL << 2*0);


 GPIOC_PUPDR &= ~(3UL << 2*13);
 GPIOC_PUPDR &= ~(3UL << 2*4);
 GPIOC_PUPDR &= ~(3UL << 2*3);
 GPIOC_PUPDR &= ~(3UL << 2*2);
 GPIOC_PUPDR &= ~(3UL << 2*1);
 GPIOC_PUPDR &= ~(3UL << 2*0);
}

void lcd_data_line_write(char d){

 set_lcd_en();
 if(d&0x80) set_lcd_d7();
 else clear_lcd_d7();
 if(d&0x40) set_lcd_d6();
 else clear_lcd_d6();
 if(d&0x20) set_lcd_d5();
 else clear_lcd_d5();
 if(d&0x10) set_lcd_d4();
 else clear_lcd_d4();
 clear_lcd_en();

 set_lcd_en();
 if(d&0x08) set_lcd_d7();
 else clear_lcd_d7();
 if(d&0x04) set_lcd_d6();
 else clear_lcd_d6();
 if(d&0x02) set_lcd_d5();
 else clear_lcd_d5();
 if(d&0x1) set_lcd_d4();
 else clear_lcd_d4();
 clear_lcd_en();

 Delay_us(1);


}

void lcd_Control_Write(char d){
 clear_lcd_rs();
 lcd_data_line_write(d);
}

void lcd_Data_Write(char d){
 set_lcd_rs();
 lcd_data_line_write(d);
 Delay_us(50);
}

void init_Lcd(){

 lcd_gpio_init();
 Delay_ms(20);

 lcd_Control_Write(0x33);
 Delay_ms(20);
 lcd_Control_Write(0x32);

 Delay_us(20);

 lcd_Control_Write( 0x28 );
 Delay_us(20);

 lcd_Control_Write( 0x08 );
 Delay_us(20);

 lcd_Control_Write( 0x01 );
 Delay_us(900);

 lcd_Control_Write( 0x06 );
 Delay_us(20);

 lcd_Control_Write( 0x0C );
 Delay_us(20);

 lcd_Control_Write( 0x02 );
 Delay_us(20);

 }

void LCD_CURSOR(char x, char y){
 unsigned char pos;
 switch(x){
 case 0: pos = y; break;
 case 1: pos = 0x40+y; break;
 default: pos = y; break;
 }

 lcd_Control_Write(0x80 | pos);
 cursor_pos = 16 * x + y;
 Delay_ms(10);
}
void LCD_CURSOR_HOME(void){
 lcd_Control_Write( 0x02 );
 Delay_ms(10);
}

void LCD_CURSOR_OFFF(){
 lcd_Control_Write( 0x0C );
 Delay_ms(10);
}

void LCD_CURSOR_ONN(){
 lcd_Control_Write( 0x0E );
 Delay_ms(10);
}
void LCD_CURSOR_ALLL(){
 lcd_Control_Write( 0x0F );
 Delay_ms(10);
}

void LCD_CURSOR_BLINKK(){
 lcd_Control_Write( 0x0D );
 Delay_ms(10);
}

void LCD_CLEAR_SCREEN(void){
 cursor_pos = 0;
 lcd_Control_Write( 0x01 );
 Delay_ms(10);
}

void LCD_RIGHT_SHIFT(void){
 lcd_Control_Write( 0x14 );
 Delay_ms(10);
}

void LCD_LEFT_SHIFT(void){
 lcd_Control_Write( 0x10 );
 Delay_ms(10);
}

void LCD_PRINT_STRING(char* d){
 while(*d){
 lcd_Data_Write(*d);
 d++;
 }
}

void LCD_PRINT_CHAR(char d){

 if(cursor_pos == 16)
 LCD_CURSOR(1,0);
 else if (cursor_pos == 32)
 LCD_CURSOR(0,0);
 cursor_pos++;
 if(d != '\0')
 lcd_Data_Write(d);
}
