#ifndef _LCD_H_
#define _LCD_H_

#define LCD_CLEAR_DISPLAY       0x01        // Clear entire display and set Display Data Address to 0. Write 0 to DDRAM
#define LCD_RETRN_HOME          0x02        // sets DDRAM address 0 and returns display from being shifted to original position. The contents of DDRAM are not change.
#define LCD_DISP_INIT           0x28        // function set is 4 bit data length and 2 lines
#define LCD_INC_MODE            0x06        // Entry mode is display Data RAM pointer incremented after write
#define LCD_DISP_ON             0x0C        // Sets entire display on, cursof off
#define LCD_DISP_OFF            0x08        // Sets entire display off, cursor off
#define LCD_CURSOR_ALL          0x0F        // Turn on cursor with blinking
#define LCD_CURSOR_ON           0x0E        // Turn on cursor
#define LCD_CURSOR_BLINK        0x0D        // Turn on and blink
#define LCD_CURSOR_OFF          0x0C        // Turn off cursor
#define LCD_CUR_MOV_LEFT        0x10        // Cursor move and shift to left
#define LCD_CUR_MOV_RIGHT       0x14        // Cursor move and shift to right
#define LCD_BUSY                0x80        // LCD is busy

#define LCD_OUT GPIOC_ODR                   // LCD Output register

// LCDs functions for set and clear bit (en, rs , d4, d5, d6, d7)
void set_lcd_en()  ;
void clear_lcd_en();

void set_lcd_rs()  ;
void clear_lcd_rs();

void set_lcd_d4()  ;
void clear_lcd_d4();

void set_lcd_d5()  ;
void clear_lcd_d5();

void set_lcd_d6()  ;
void clear_lcd_d6();

void set_lcd_d7()  ;
void clear_lcd_d7();

// Funciton to initialize LCD pins
// GPIO: PC0, PC1, PC2, PC3, PC4, PC13
void lcd_gpio_init();

void lcd_data_line_write(char d);

void lcd_Control_Write(char d);

void lcd_Data_Write(char d);

void init_Lcd();


// LCD utilis function

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


#endif