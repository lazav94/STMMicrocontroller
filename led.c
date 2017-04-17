#include "led.h"

// GPIO: PE12(left), PE15(right)
void init_LEDs(){
    RCC_AHB1ENR    |= (1UL << LEFT_LED_PORT);       // Enable GPIOE clock for left led
    // RCC_AHB1ENR    |= (1UL << RIGHT_LED_PORT);       // Enable GPIOE clock for right led
    
    init_GPIO_Pin(MODER,   LEFT_LED_PORT,  LEFT_LED_PIN,  OUTPUT);
    init_GPIO_Pin(OTYPER,  LEFT_LED_PORT,  LEFT_LED_PIN,  PUSH_PULL);
    init_GPIO_Pin(OSPEEDR, LEFT_LED_PORT,  LEFT_LED_PIN,  HIGH);
    init_GPIO_Pin(PUPDR,   LEFT_LED_PORT,  LEFT_LED_PIN,  PULL_UP);
    
    init_GPIO_Pin(MODER,   RIGHT_LED_PORT, RIGHT_LED_PIN, OUTPUT);
    init_GPIO_Pin(OTYPER,  RIGHT_LED_PORT, RIGHT_LED_PIN, PUSH_PULL);
    init_GPIO_Pin(OSPEEDR, RIGHT_LED_PORT, RIGHT_LED_PIN, HIGH);
    init_GPIO_Pin(PUPDR,   RIGHT_LED_PORT, RIGHT_LED_PIN, PULL_UP);
    

}
 /*

void init_LEDs_2(){

    RCC_AHB1ENR    |= (1UL << 4);      // Enable GPIOD clock

    // Left LED
    GPIOE_MODER    &= ~(3UL << 2*12);    // Clear bits in MODER
    GPIOE_MODER    |=  (1UL << 2*12);    // Set pin PE12 to Output (01)

    GPIOE_OTYPER   &= ~(1UL << 12);      // Output type register: Output push-pull  (just one bti)

    GPIOE_OSPEEDR  &= ~(3UL << 2*12);    // Clear bits in OSPEEDR
    GPIOE_OSPEEDR  |=  (2UL << 2*12);    // Set High speed   (2h = 10b)

    GPIOE_PUPDR    &= ~(3UL << 2*12);    // Clear bits in PUPDR
    GPIOE_PUPDR    |=  (1UL << 2*12);    // Set Pull-down   (2h = 10b)

    // Right LED
    GPIOE_MODER    &= ~(3UL << 2*15);    // Clear bits for MODER (mode register)
    GPIOE_MODER    |=  (1UL << 2*15);    // Set pin PE15 to Output (01)

 //   init_GPIO_Pin(MODER,   PORT_E, BIT_15, OUTPUT);

    GPIOE_OTYPER   &= ~(1UL << 15);      // Output type register: Output push-pull  (just one bti)

    GPIOE_OSPEEDR  &= ~(3UL << 2*15);    // Clear bits in OSPEEDR (Output SPEED Register)
    GPIOE_OSPEEDR  |=  (2UL << 2*15);    // Set High speed   (2h = 10b)

    GPIOE_PUPDR    &= ~(3UL << 2*15);    // Clear bits for pupdr (pull-up/pull-down register)
    GPIOE_PUPDR    |=  (1UL << 2*15);    // Set Pull-down   (2h = 10b)

}   */