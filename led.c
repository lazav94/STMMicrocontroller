#include "led.h"

                                                                                                                                  // GPIO: PE12(left), PE15(right)
void init_LEDs(){

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

    GPIOE_OTYPER   &= ~(1UL << 15);      // Output type register: Output push-pull  (just one bti)

    GPIOE_OSPEEDR  &= ~(3UL << 2*15);    // Clear bits in OSPEEDR (Output SPEED Register)
    GPIOE_OSPEEDR  |=  (2UL << 2*15);    // Set High speed   (2h = 10b)

    GPIOE_PUPDR    &= ~(3UL << 2*15);    // Clear bits for pupdr (pull-up/pull-down register)
    GPIOE_PUPDR    |=  (1UL << 2*15);    // Set Pull-down   (2h = 10b)

}