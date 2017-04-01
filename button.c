#include "button.h"

void init_Buttons(){
    //Init left button
    init_GPIO_Pin(MODER,   LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  INPUT);
    init_GPIO_Pin(OSPEEDR, LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  HIGH);
    init_GPIO_Pin(PUPDR,   LEFT_BUTTON_PORT,  LEFT_BUTTON_PIN,  PULL_UP);

    SYSCFG_EXTICR1 |= 0x4;               // SYStem Configuration Controler - EXTernal Interrupt Configuration Register 1
                                         // EXTI0 (on first 4 bits) interrupt Port E (4 - 0100)

    EXTI_IMR       |= 1;                 // Interrupt mask on line (1)
    EXTI_FTSR      |= 1;                 // Fall edge (press button)
  //EXTI_RTSR      |= 1;                 // Rise edge (realese button)

    NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller

    //Init right button
    init_GPIO_Pin(MODER,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, INPUT);
    init_GPIO_Pin(OSPEEDR, RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, HIGH);
    init_GPIO_Pin(PUPDR,   RIGHT_BUTTON_PORT, RIGHT_BUTTON_PIN, PULL_UP);

    SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)



    EXTI_IMR       |= (1 << 10);         // Interrupt mask on line (10)
    EXTI_FTSR      |= (1 << 10);         // Fall edge (press button)
  //EXTI_RTSR      |= (1 << 10);         // Rise edge (realese button)

    NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller

}

void init_Buttons_2(){
    //Init left button
    GPIOE_MODER    &= ~(3UL << 2*0);   // Clear bits in MODER - Input (00)

    GPIOE_OSPEEDR  &= ~(3UL << 2*0);   // Clear bits in OSPEEDR
    GPIOE_OSPEEDR  |=  2UL << 2*0;   // Set High speed   (2h = 10b)

    GPIOE_PUPDR    &= ~(3UL << 2*0);   // Clear bits in PUPDR
    GPIOE_PUPDR    |=  1UL << 2*0;   // Set Pull-down  (2h = 10b)

    SYSCFG_EXTICR1 |= 0x4;               // SYStem Configuration Controler - EXTernal Interrupt Configuration Register 1
                                         // EXTI0 (on first 4 bits) interrupt Port E (4 - 0100)

    EXTI_IMR       |= 1;                 // Interrupt mask on line (1)
    EXTI_FTSR      |= 1;                 // Fall edge (press button)
  //EXTI_RTSR      |= 1;                 // Rise edge (realese button)

    NVIC_IntEnable(IVT_INT_EXTI0);       // Nested Vector Interrupt Controller

    //Init right button
    GPIOA_MODER    &= ~(3UL << 2*10);  // Clear bits in MODER - Input (00)

    GPIOA_OSPEEDR  &= ~(3UL << 2*10);  // Clear bits in OSPEEDR
    GPIOA_OSPEEDR  |=  2UL << 2*10;  // Set High speed - (2h = 10b)

    SYSCFG_EXTICR3 &= ~(15UL << 8);      // EXTI 10 (on 3x4 bits) interrupt Port A (0 - 0000)

    GPIOA_PUPDR    &= ~(3UL << 2*10);  // Clear bits in PUPDR
    GPIOA_PUPDR    |=  1UL << 2*10;  // Set Pull-down (2h = 10b)

    EXTI_IMR       |= (1 << 10);         // Interrupt mask on line (10)
    EXTI_FTSR      |= (1 << 10);         // Fall edge (press button)
  //EXTI_RTSR      |= (1 << 10);         // Rise edge (realese button)

    NVIC_IntEnable(IVT_INT_EXTI15_10);   // Nested Vector Interrupt Controller

}