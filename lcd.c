#include "lcd.h"

volatile unsigned int cursor_pos = 0;
volatile unsigned char screen_space = 0;


void set_lcd_en()  { GPIOC_ODR |=  (1UL << LCD_EN_PIN); }
void clear_lcd_en(){ GPIOC_ODR &= ~(1UL << LCD_EN_PIN); }

void set_lcd_rs()  { GPIOC_ODR |=  (1UL << LCD_RS_PIN); }
void clear_lcd_rs(){ GPIOC_ODR &= ~(1UL << LCD_RS_PIN); }

void set_lcd_d4()  { GPIOC_ODR |=  (1UL << LCD_D4_PIN); }
void clear_lcd_d4(){ GPIOC_ODR &= ~(1UL << LCD_D4_PIN); }

void set_lcd_d5()  { GPIOC_ODR |=  (1UL << LCD_D5_PIN); }
void clear_lcd_d5(){ GPIOC_ODR &= ~(1UL << LCD_D5_PIN); }

void set_lcd_d6()  { GPIOC_ODR |=  (1UL << LCD_D6_PIN); }
void clear_lcd_d6(){ GPIOC_ODR &= ~(1UL << LCD_D6_PIN); }

void set_lcd_d7()  { GPIOC_ODR |=  (1UL << LCD_D7_PIN); }
void clear_lcd_d7(){ GPIOC_ODR &= ~(1UL << LCD_D7_PIN); }

void lcd_gpio_init(){
    // Enable GPIOC clock
    RCC_AHB1ENR    |= (1UL << 2) ;


    //int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val)
    init_GPIO_Pin(MODER,   LCD_EN_PORT, LCD_EN_PIN  ,OUTPUT);
    init_GPIO_Pin(MODER,   LCD_RS_PORT, LCD_RS_PIN  ,OUTPUT);
    init_GPIO_Pin(MODER,   LCD_D4_PORT, LCD_D4_PIN  ,OUTPUT);
    init_GPIO_Pin(MODER,   LCD_D5_PORT, LCD_D5_PIN  ,OUTPUT);
    init_GPIO_Pin(MODER,   LCD_D6_PORT, LCD_D6_PIN  ,OUTPUT);
    init_GPIO_Pin(MODER,   LCD_D7_PORT, LCD_D7_PIN  ,OUTPUT);


    // Set no push-pull (reset state) on zero for ports C0 C1 C2 C3 C4 C13
    init_GPIO_Pin(OTYPER,  LCD_EN_PORT, LCD_EN_PIN  ,PUSH_PULL);
    init_GPIO_Pin(OTYPER,  LCD_RS_PORT, LCD_RS_PIN  ,PUSH_PULL);
    init_GPIO_Pin(OTYPER,  LCD_D4_PORT, LCD_D4_PIN  ,PUSH_PULL);
    init_GPIO_Pin(OTYPER,  LCD_D5_PORT, LCD_D5_PIN  ,PUSH_PULL);
    init_GPIO_Pin(OTYPER,  LCD_D6_PORT, LCD_D6_PIN  ,PUSH_PULL);
    init_GPIO_Pin(OTYPER,  LCD_D7_PORT, LCD_D7_PIN  ,PUSH_PULL);
    

    // Clear bits OSEED registar for ports  C0 C1 C2 C3 C4 C13
    init_GPIO_Pin(OSPEEDR, LCD_EN_PORT, LCD_EN_PIN  ,HIGH);
    init_GPIO_Pin(OSPEEDR, LCD_RS_PORT, LCD_RS_PIN  ,HIGH);
    init_GPIO_Pin(OSPEEDR, LCD_D4_PORT, LCD_D4_PIN  ,HIGH);
    init_GPIO_Pin(OSPEEDR, LCD_D5_PORT, LCD_D5_PIN  ,HIGH);
    init_GPIO_Pin(OSPEEDR, LCD_D6_PORT, LCD_D6_PIN  ,HIGH);
    init_GPIO_Pin(OSPEEDR, LCD_D7_PORT, LCD_D7_PIN  ,HIGH);
    
    // Clear bits PUPD registar for ports  C0 C1 C2 C3 C4 C13 - NO PULL (00b = 0)
    init_GPIO_Pin(PUPDR,   LCD_EN_PORT, LCD_EN_PIN  ,NO_PULL_PUSH);
    init_GPIO_Pin(PUPDR,   LCD_RS_PORT, LCD_RS_PIN  ,NO_PULL_PUSH);
    init_GPIO_Pin(PUPDR,   LCD_D4_PORT, LCD_D4_PIN  ,NO_PULL_PUSH);
    init_GPIO_Pin(PUPDR,   LCD_D5_PORT, LCD_D5_PIN  ,NO_PULL_PUSH);
    init_GPIO_Pin(PUPDR,   LCD_D6_PORT, LCD_D6_PIN  ,NO_PULL_PUSH);
    init_GPIO_Pin(PUPDR,   LCD_D7_PORT, LCD_D7_PIN  ,NO_PULL_PUSH);


}
void lcd_gpio_init_2(){

    // Enable GPIOC clock
    RCC_AHB1ENR    |= (1UL << 2) ;

    // Clear bits for ports C0 C1 C2 C3 C4 C13
    GPIOC_MODER    &= ~(3UL << 2*13);
    GPIOC_MODER    &= ~(3UL << 2*4);
    GPIOC_MODER    &= ~(3UL << 2*3);
    GPIOC_MODER    &= ~(3UL << 2*2);
    GPIOC_MODER    &= ~(3UL << 2*1);
    GPIOC_MODER    &= ~(3UL << 2*0);

    // Set bits for ports C0 C1 C2 C3 C4 C13 OUTPUT MODE (01b)
    GPIOC_MODER    |= (1UL << 2*13);
    GPIOC_MODER    |= (1UL << 2*4);
    GPIOC_MODER    |= (1UL << 2*3);
    GPIOC_MODER    |= (1UL << 2*2);
    GPIOC_MODER    |= (1UL << 2*1);
    GPIOC_MODER    |= (1UL << 2*0);


    // Set no push-pull (reset state) on zero for ports C0 C1 C2 C3 C4 C13
    GPIOC_OTYPER   &= ~(3UL << 13);
    GPIOC_OTYPER   &= ~(3UL << 4);
    GPIOC_OTYPER   &= ~(3UL << 3);
    GPIOC_OTYPER   &= ~(3UL << 2);
    GPIOC_OTYPER   &= ~(3UL << 1);
    GPIOC_OTYPER   &= ~(3UL << 0);

    // Clear bits OSEED registar for ports  C0 C1 C2 C3 C4 C13
    GPIOC_OSPEEDR  &= ~(3UL << 2*13);
    GPIOC_OSPEEDR  &= ~(3UL << 2*4);
    GPIOC_OSPEEDR  &= ~(3UL << 2*3);
    GPIOC_OSPEEDR  &= ~(3UL << 2*2);
    GPIOC_OSPEEDR  &= ~(3UL << 2*1);
    GPIOC_OSPEEDR  &= ~(3UL << 2*0);

    // Set bits OSEED registar for ports  C0 C1 C2 C3 C4 C13    on high speed (2h = 10b)
    GPIOC_OSPEEDR  |=  (2UL << 2*13);
    GPIOC_OSPEEDR  |=  (2UL << 2*4);
    GPIOC_OSPEEDR  |=  (2UL << 2*3);
    GPIOC_OSPEEDR  |=  (2UL << 2*2);
    GPIOC_OSPEEDR  |=  (2UL << 2*1);
    GPIOC_OSPEEDR  |=  (2UL << 2*0);

    // Clear bits PUPD registar for ports  C0 C1 C2 C3 C4 C13 - NO PULL (00b = 0)
    GPIOC_PUPDR    &= ~(3UL << 2*13);
    GPIOC_PUPDR    &= ~(3UL << 2*4);
    GPIOC_PUPDR    &= ~(3UL << 2*3);
    GPIOC_PUPDR    &= ~(3UL << 2*2);
    GPIOC_PUPDR    &= ~(3UL << 2*1);
    GPIOC_PUPDR    &= ~(3UL << 2*0);
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

    lcd_Control_Write(LCD_DISP_INIT);     // 0x28  Start to set LCD function
    Delay_us(20);

    lcd_Control_Write(LCD_DISP_OFF);
    Delay_us(20);

    lcd_Control_Write(LCD_CLEAR_DISPLAY); //0x01  clear LCD
    Delay_us(900);

    lcd_Control_Write(LCD_INC_MODE);      // set entry mode
    Delay_us(20);

    lcd_Control_Write(LCD_DISP_ON);       // set display to on
    Delay_us(20);

    lcd_Control_Write(LCD_RETRN_HOME);    // move cursor to home and set data address to 0
    Delay_us(20);

 }

void LCD_CURSOR(char x, char y){
    unsigned char pos;
    switch(x){
        case 0:  pos = y;      break;
        case 1:  pos = 0x40+y; break;
        default: pos = y;      break;
    }
    // set data address
    lcd_Control_Write(0x80 | pos);
    cursor_pos = 16 * x + y;
    Delay_ms(10);
}
void LCD_CURSOR_HOME(void){
    lcd_Control_Write(LCD_RETRN_HOME);
    Delay_ms(10);
}

void LCD_CURSOR_OFFF(){
    lcd_Control_Write(LCD_CURSOR_OFF);
    Delay_ms(10);
}

void LCD_CURSOR_ONN(){
    lcd_Control_Write(LCD_CURSOR_ON);
    Delay_ms(10);
}
void LCD_CURSOR_ALLL(){
    lcd_Control_Write(LCD_CURSOR_ALL);
    Delay_ms(10);
}

void LCD_CURSOR_BLINKK(){
    lcd_Control_Write(LCD_CURSOR_BLINK);
    Delay_ms(10);
}

void LCD_CLEAR_SCREEN(void){
    cursor_pos = 0;
    lcd_Control_Write(LCD_CLEAR_DISPLAY);
    Delay_ms(10);
}

void LCD_RIGHT_SHIFT(void){
    lcd_Control_Write(LCD_CUR_MOV_RIGHT);
    Delay_ms(10);
}

void LCD_LEFT_SHIFT(void){
    lcd_Control_Write(LCD_CUR_MOV_LEFT);
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