#line 1 "C:/Users/Lazar.Vasic/Desktop/MIPS/main2.c"
volatile sbit LED_1 at GPIOE_ODR.B12;
volatile sbit LED_2 at GPIOE_ODR.B15;


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



void doSomething(){
 while(1){
 LED_1 = !LED_1;
 LED_2 = !LED_1;
 }
}

void main(){
 init_LEDs();
 Delay_ms(100);

 doSomething();

}
