#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
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
#line 4 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
void init_LEDs(){
 RCC_AHB1ENR |= (1UL <<  4 );


 init_GPIO_Pin( 0 ,  4 ,  12 ,  1UL );
 init_GPIO_Pin( 1 ,  4 ,  12 ,  0UL );
 init_GPIO_Pin( 2 ,  4 ,  12 ,  2UL );
 init_GPIO_Pin( 3 ,  4 ,  12 ,  1UL );

 init_GPIO_Pin( 0 ,  4 ,  15 ,  1UL );
 init_GPIO_Pin( 1 ,  4 ,  15 ,  0UL );
 init_GPIO_Pin( 2 ,  4 ,  15 ,  2UL );
 init_GPIO_Pin( 3 ,  4 ,  15 ,  1UL );


}
