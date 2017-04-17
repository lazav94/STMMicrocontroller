#include "gpio.h"
#include "lcd.h"
 /*
int init_ODR(sbit per, unsigned port, unsigned no){
    switch(port){
        case PORT_A:
            per at PIOA_ODR.no;
            break;
        case PORT_B:
            per at GPIOB_ODR.no;
            break;
        case PORT_C:
            per at GPIOC_ODR.no;
            break;
        case PORT_D:
            per at GPIOD_ODR.no;
            break;
        case PORT_E:
            per at GPIOE_ODR.no;
            break;
    }
}  */

int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val){
    if(type != OTYPER) no <<= 1;

    switch(type){

        case MODER:
             switch(port){
                 case PORT_A:
                      GPIOA_MODER   &= ~(3UL << no);
                      GPIOA_MODER   |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_MODER   &= ~(3UL << no);
                      GPIOB_MODER   |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_MODER   &= ~(3UL << no);
                      GPIOC_MODER   |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_MODER   &= ~(3UL << no);
                      GPIOD_MODER   |=  (val << no); return 0;
                 case PORT_E:
                      GPIOE_MODER    &= ~(3UL << no);
                      GPIOE_MODER    |=  (val << no); return 0;
                 default:
                      return 1;
             }
        case OTYPER:
              switch(port){
                 case PORT_A:
                      GPIOA_OTYPER   &= ~(1UL << no);
                      GPIOA_OTYPER   |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_OTYPER   &= ~(1UL << no);
                      GPIOB_OTYPER   |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_OTYPER   &= ~(1UL << no);
                      GPIOC_OTYPER   |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_OTYPER   &= ~(1UL << no);
                      GPIOD_OTYPER   |= (val << no); return 0;
                 case PORT_E:
                      GPIOE_OTYPER   &= ~(1UL << no);
                      GPIOE_OTYPER   |= (val << no); return 0;
                 default:
                      return 2;
             }
        case OSPEEDR:
             switch(port){
                 case PORT_A:
                      GPIOA_OSPEEDR &= ~(3UL << no);
                      GPIOA_OSPEEDR |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_OSPEEDR &= ~(3UL << no);
                      GPIOB_OSPEEDR |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_OSPEEDR &= ~(3UL << no);
                      GPIOC_OSPEEDR |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_OSPEEDR &= ~(3UL << no);
                      GPIOD_OSPEEDR |= (val << no); return 0;
                 case PORT_E:
                      GPIOE_OSPEEDR &= ~(3UL << no);
                      GPIOE_OSPEEDR |= (val << no); return 0;
                 default:
                      return 3;
             }
        case PUPDR:
             switch(port){
                 case PORT_A:
                      GPIOA_PUPDR   &= ~(3UL << no);
                      GPIOA_PUPDR   |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_PUPDR   &= ~(3UL << no);
                      GPIOB_PUPDR   |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_PUPDR   &= ~(3UL << no);
                      GPIOC_PUPDR   |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_PUPDR   &= ~(3UL << no);
                      GPIOD_PUPDR   |= (val << no); return 0;
                 case PORT_E:
                      GPIOE_PUPDR   &= ~(3UL << no);
                      GPIOE_PUPDR   |= (val << no); return 0;
                 default:
                      return 4;
             }
         case AFRL:
             switch(port){
                 case PORT_A:
                      GPIOA_AFRL    &= ~(3UL << no);
                      GPIOA_AFRL    |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_AFRL    &= ~(3UL << no);
                      GPIOB_AFRL    |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_AFRL    &= ~(3UL << no);
                      GPIOC_AFRL    |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_AFRL    &= ~(3UL << no);
                      GPIOD_AFRL    |= (val << no); return 0;
                 case PORT_E:
                      GPIOE_AFRL    &= ~(3UL << no);
                      GPIOE_AFRL    |= (val << no); return 0;
                 default:
                      return 4;
             }
         case AFRH:
             switch(port){
                 case PORT_A:
                      GPIOA_AFRH    &= ~(3UL << no);
                      GPIOA_AFRH    |= (val << no); return 0;
                 case PORT_B:
                      GPIOB_AFRH    &= ~(3UL << no);
                      GPIOB_AFRH    |= (val << no); return 0;
                 case PORT_C:
                      GPIOC_AFRH    &= ~(3UL << no);
                      GPIOC_AFRH    |= (val << no); return 0;
                 case PORT_D:
                      GPIOD_AFRH    &= ~(3UL << no);
                      GPIOD_AFRH    |= (val << no); return 0;
                 case PORT_E:
                      GPIOE_AFRH    &= ~(3UL << no);
                      GPIOE_AFRH    |= (val << no); return 0;
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

         case CR1:
               UART4_CR1 &= ~(val << no);
               UART4_CR1 |=   val << no;
         break;
        // case CR2: UART4_CR2 = val;  break;
        // case CR3: UART4_CR3 = val;  break;
         default: return -1;

     }
     return 0;
}