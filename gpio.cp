#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/gpio.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/lcd.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
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
#line 24 "C:/Users/Lazar.Vasic/Desktop/MIPS/gpio.c"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val){
 if(type !=  1 ) no <<= 1;

 switch(type){

 case  0 :
 switch(port){
 case  0 :
 GPIOA_MODER &= ~(3UL << no);
 GPIOA_MODER |= (val << no); return 0;
 case  1 :
 GPIOB_MODER &= ~(3UL << no);
 GPIOB_MODER |= (val << no); return 0;
 case  2 :
 GPIOC_MODER &= ~(3UL << no);
 GPIOC_MODER |= (val << no); return 0;
 case  3 :
 GPIOD_MODER &= ~(3UL << no);
 GPIOD_MODER |= (val << no); return 0;
 case  4 :
 GPIOE_MODER &= ~(3UL << no);
 GPIOE_MODER |= (val << no); return 0;
 default:
 return 1;
 }
 case  1 :
 switch(port){
 case  0 :
 GPIOA_OTYPER &= ~(1UL << no);
 GPIOA_OTYPER |= (val << no); return 0;
 case  1 :
 GPIOB_OTYPER &= ~(1UL << no);
 GPIOB_OTYPER |= (val << no); return 0;
 case  2 :
 GPIOC_OTYPER &= ~(1UL << no);
 GPIOC_OTYPER |= (val << no); return 0;
 case  3 :
 GPIOD_OTYPER &= ~(1UL << no);
 GPIOD_OTYPER |= (val << no); return 0;
 case  4 :
 GPIOE_OTYPER &= ~(1UL << no);
 GPIOE_OTYPER |= (val << no); return 0;
 default:
 return 2;
 }
 case  2 :
 switch(port){
 case  0 :
 GPIOA_OSPEEDR &= ~(3UL << no);
 GPIOA_OSPEEDR |= (val << no); return 0;
 case  1 :
 GPIOB_OSPEEDR &= ~(3UL << no);
 GPIOB_OSPEEDR |= (val << no); return 0;
 case  2 :
 GPIOC_OSPEEDR &= ~(3UL << no);
 GPIOC_OSPEEDR |= (val << no); return 0;
 case  3 :
 GPIOD_OSPEEDR &= ~(3UL << no);
 GPIOD_OSPEEDR |= (val << no); return 0;
 case  4 :
 GPIOE_OSPEEDR &= ~(3UL << no);
 GPIOE_OSPEEDR |= (val << no); return 0;
 default:
 return 3;
 }
 case  3 :
 switch(port){
 case  0 :
 GPIOA_PUPDR &= ~(3UL << no);
 GPIOA_PUPDR |= (val << no); return 0;
 case  1 :
 GPIOB_PUPDR &= ~(3UL << no);
 GPIOB_PUPDR |= (val << no); return 0;
 case  2 :
 GPIOC_PUPDR &= ~(3UL << no);
 GPIOC_PUPDR |= (val << no); return 0;
 case  3 :
 GPIOD_PUPDR &= ~(3UL << no);
 GPIOD_PUPDR |= (val << no); return 0;
 case  4 :
 GPIOE_PUPDR &= ~(3UL << no);
 GPIOE_PUPDR |= (val << no); return 0;
 default:
 return 4;
 }
 case  4 :
 switch(port){
 case  0 :
 GPIOA_AFRL &= ~(3UL << no);
 GPIOA_AFRL |= (val << no); return 0;
 case  1 :
 GPIOB_AFRL &= ~(3UL << no);
 GPIOB_AFRL |= (val << no); return 0;
 case  2 :
 GPIOC_AFRL &= ~(3UL << no);
 GPIOC_AFRL |= (val << no); return 0;
 case  3 :
 GPIOD_AFRL &= ~(3UL << no);
 GPIOD_AFRL |= (val << no); return 0;
 case  4 :
 GPIOE_AFRL &= ~(3UL << no);
 GPIOE_AFRL |= (val << no); return 0;
 default:
 return 4;
 }
 case  5 :
 switch(port){
 case  0 :
 GPIOA_AFRH &= ~(3UL << no);
 GPIOA_AFRH |= (val << no); return 0;
 case  1 :
 GPIOB_AFRH &= ~(3UL << no);
 GPIOB_AFRH |= (val << no); return 0;
 case  2 :
 GPIOC_AFRH &= ~(3UL << no);
 GPIOC_AFRH |= (val << no); return 0;
 case  3 :
 GPIOD_AFRH &= ~(3UL << no);
 GPIOD_AFRH |= (val << no); return 0;
 case  4 :
 GPIOE_AFRH &= ~(3UL << no);
 GPIOE_AFRH |= (val << no); return 0;
 default:
 return 4;
 }
 default:
 return 5;
 }
 return 0;
}


int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val){
 switch(type){

 case  1 :
 UART4_CR1 &= ~(val << no);
 UART4_CR1 |= val << no;
 break;


 default: return -1;

 }
 return 0;
}
