#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/button.h"






void init_Buttons();
#line 3 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
void init_Buttons(){

 GPIOE_MODER &= ~((3UL << 2*0));

 GPIOE_OSPEEDR &= ~((3UL << 2*0));
 GPIOE_OSPEEDR |= ((2UL << 2*0));

 GPIOE_PUPDR &= ~((3UL << 2*0));
 GPIOE_PUPDR |= ((1UL << 2*0));

 SYSCFG_EXTICR1 |= 0x4;


 EXTI_IMR |= 1;
 EXTI_FTSR |= 1;


 NVIC_IntEnable(IVT_INT_EXTI0);


 GPIOA_MODER &= ~((3UL << 2*10));

 GPIOA_OSPEEDR &= ~((3UL << 2*10));
 GPIOA_OSPEEDR |= ((2UL << 2*10));

 SYSCFG_EXTICR3 &= ~(15UL << 8);

 GPIOA_PUPDR &= ~((3UL << 2*10));
 GPIOA_PUPDR |= ((1UL << 2*10));

 EXTI_IMR |= (1 << 10);
 EXTI_FTSR |= (1 << 10);


 NVIC_IntEnable(IVT_INT_EXTI15_10);

}
