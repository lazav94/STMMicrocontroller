#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/led.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 17 "c:/users/lazar.vasic/desktop/mips/led.h"
void init_LEDs();
void init_LEDs_2();
#line 6 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
void init_LEDs(){
 RCC_AHB1ENR |= (1UL << 4);


 init_GPIO_Pin( 0 ,  4 ,  12 ,  1UL );
 init_GPIO_Pin( 1 ,  4 ,  12 ,  0x0 );
 init_GPIO_Pin( 2 ,  4 ,  12 ,  0x2 );
 init_GPIO_Pin( 3 ,  4 ,  12 ,  0x1 );

 init_GPIO_Pin( 0 ,  4 ,  15 ,  1UL );
 init_GPIO_Pin( 1 ,  4 ,  15 ,  0x0 );
 init_GPIO_Pin( 2 ,  4 ,  15 ,  0x2 );
 init_GPIO_Pin( 3 ,  4 ,  15 ,  0x1 );


}


void init_LEDs_2(){

 RCC_AHB1ENR |= (1UL << 4);


 GPIOE_MODER &= ~(3UL << 2*12);
 GPIOE_MODER |= (1UL << 2*12);

 GPIOE_OTYPER &= ~(1UL << 12);

 GPIOE_OSPEEDR &= ~(3UL << 2*12);
 GPIOE_OSPEEDR |= (2UL << 2*12);

 GPIOE_PUPDR &= ~(3UL << 2*12);
 GPIOE_PUPDR |= (1UL << 2*12);


 GPIOE_MODER &= ~(3UL << 2*15);
 GPIOE_MODER |= (1UL << 2*15);

 init_GPIO_Pin( 0 ,  4 ,  15 ,  1UL );

 GPIOE_OTYPER &= ~(1UL << 15);

 GPIOE_OSPEEDR &= ~(3UL << 2*15);
 GPIOE_OSPEEDR |= (2UL << 2*15);

 GPIOE_PUPDR &= ~(3UL << 2*15);
 GPIOE_PUPDR |= (1UL << 2*15);

}
