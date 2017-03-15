#ifndef _UART_H_
#define _UART_H_

#define ALPHABET_SIZE 36

#define DASH_TIME 2 // Two second for dash (change this definition)
#define DOT  '.'
#define DASH '-'


static const char *alpha[] = {
    "-----", //0
    ".----", //1
    "..---", //2
    "...--", //3
    "....-", //4
    ".....", //5
    "-....", //6
    "--...", //7
    "---..", //8
    "----.", //9
    ".-",   //A
    "-...", //B
    "-.-.", //C
    "-..",  //D
    ".",    //E
    "..-.", //F
    "--.",  //G
    "....", //H
    "..",   //I
    ".---", //J
    "-.-",  //K
    ".-..", //L
    "--",   //M
    "-.",   //N
    "---",  //O
    ".--.", //P
    "--.-", //Q
    ".-.",  //R
    "...",  //S
    "-",    //T
    "..-",  //U
    "...-", //V
    ".--",  //W
    "-..-", //X
    "-.--", //Y
    "--..", //Z
};



void init_UART_pins();

void init_UART();


void SendCharInterrupt (int ch) ;

void SendStringInterrupt(char *s);

int charToInt(char c);

int convert(char c);

void convertString(char *s);

int findLetter();

char intToChar(int i);

void clearLetter();

void translate();

void fnc(char DD);

#endif