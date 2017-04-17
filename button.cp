#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
#line 1 "c:/users/lazar.vasic/desktop/mips/button.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/gpio.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 13 "c:/users/lazar.vasic/desktop/mips/gpio.h"
int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val);
#line 1 "c:/users/lazar.vasic/desktop/mips/config.h"
#line 1 "c:/users/lazar.vasic/desktop/mips/definitions.h"
#line 9 "c:/users/lazar.vasic/desktop/mips/button.h"
void init_Buttons();
#line 3 "C:/Users/Lazar.Vasic/Desktop/MIPS/button.c"
void init_Buttons(){

 init_GPIO_Pin( 0 ,  4 ,  0 ,  0UL );
 init_GPIO_Pin( 2 ,  4 ,  0 ,  2UL );
 init_GPIO_Pin( 3 ,  4 ,  0 ,  1UL );

 SYSCFG_EXTICR1 |= 0x4;


 EXTI_IMR |= 1 <<  0 ;
 EXTI_FTSR |= 1 <<  0 ;



 NVIC_IntEnable(IVT_INT_EXTI0);


 init_GPIO_Pin( 0 ,  0 ,  10 ,  0UL );
 init_GPIO_Pin( 2 ,  0 ,  10 ,  2UL );
 init_GPIO_Pin( 3 ,  0 ,  10 ,  1UL );

 SYSCFG_EXTICR3 &= ~(15UL << 8);



 EXTI_IMR |= 1 <<  10 ;
 EXTI_FTSR |= 1 <<  10 ;


 NVIC_IntEnable(IVT_INT_EXTI15_10);

}
