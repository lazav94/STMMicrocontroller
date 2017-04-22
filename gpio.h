#ifndef _GPIO_H_
#define _GPIO_H_

#include "definitions.h"

int init_GPIO_Pin(unsigned long type, unsigned long port, unsigned long no, unsigned long val);
int init_UART4_Register(unsigned long type, unsigned long no, unsigned long val);


#endif