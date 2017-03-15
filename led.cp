#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/led.h"





void init_LEDs();
#line 4 "C:/Users/Lazar.Vasic/Desktop/MIPS/led.c"
void init_LEDs(){

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

 GPIOE_OTYPER &= ~(1UL << 15);

 GPIOE_OSPEEDR &= ~(3UL << 2*15);
 GPIOE_OSPEEDR |= (2UL << 2*15);

 GPIOE_PUPDR &= ~(3UL << 2*15);
 GPIOE_PUPDR |= (1UL << 2*15);

}
