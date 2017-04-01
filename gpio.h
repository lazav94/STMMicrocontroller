#ifndef _GPIO_H_
#define _GPIO_H_

#include <definitions.h>

// type: MODER, OTTYPER...
// port : PORT_A,..., PORT_E
// BIT_0, ... , BIT_15
// VALUE can be depend on TYPE!   



int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);


//int init_UART_Pin(unsigned int uart_type, unsigned int port, unisgned int no , unistigne int val);
  /*  TODO

       GPIOA_AFRL
       
        UART4_BRR ;

    UART4_CR1
    UART4_CR2
    UART4_CR3



  
  */


#endif