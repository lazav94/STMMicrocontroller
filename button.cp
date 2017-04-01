#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/button.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 9 "c:/users/lazar.vasic/desktop/mips/button.h"
void init_Buttons();
void init_Buttons_2();
#line 3 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
void init_Buttons(){

 init_GPIO_Pin( 0 ,  4 ,  0 ,  0UL );
 init_GPIO_Pin( 2 ,  4 ,  0 ,  0x2 );
 init_GPIO_Pin( 3 ,  4 ,  0 ,  0x1 );

 SYSCFG_EXTICR1 |= 0x4;


 EXTI_IMR |= 1;
 EXTI_FTSR |= 1;


 NVIC_IntEnable(IVT_INT_EXTI0);


 init_GPIO_Pin( 0 ,  0 ,  10 ,  0UL );
 init_GPIO_Pin( 2 ,  0 ,  10 ,  0x2 );
 init_GPIO_Pin( 3 ,  0 ,  10 ,  0x1 );

 SYSCFG_EXTICR3 &= ~(15UL << 8);



 EXTI_IMR |= (1 << 10);
 EXTI_FTSR |= (1 << 10);


 NVIC_IntEnable(IVT_INT_EXTI15_10);

}

void init_Buttons_2(){

 GPIOE_MODER &= ~(3UL << 2*0);

 GPIOE_OSPEEDR &= ~(3UL << 2*0);
 GPIOE_OSPEEDR |= 2UL << 2*0;

 GPIOE_PUPDR &= ~(3UL << 2*0);
 GPIOE_PUPDR |= 1UL << 2*0;

 SYSCFG_EXTICR1 |= 0x4;


 EXTI_IMR |= 1;
 EXTI_FTSR |= 1;


 NVIC_IntEnable(IVT_INT_EXTI0);


 GPIOA_MODER &= ~(3UL << 2*10);

 GPIOA_OSPEEDR &= ~(3UL << 2*10);
 GPIOA_OSPEEDR |= 2UL << 2*10;

 SYSCFG_EXTICR3 &= ~(15UL << 8);

 GPIOA_PUPDR &= ~(3UL << 2*10);
 GPIOA_PUPDR |= 1UL << 2*10;

 EXTI_IMR |= (1 << 10);
 EXTI_FTSR |= (1 << 10);


 NVIC_IntEnable(IVT_INT_EXTI15_10);

}
