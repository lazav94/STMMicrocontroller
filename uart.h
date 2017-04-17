#ifndef _UART_H_
#define _UART_H_

#define ALPHABET_SIZE 36


/*
  Each Morse code symbol represents either a text character (letter or numeral) or a prosign and is represented by a unique sequence of dots and dashes.
  The duration of a dash is three times the duration of a dot. Each dot or dash is followed by a short silence, equal to the dot duration.
  The letters of a word are separated by a space equal to three dots (one dash), and the words are separated by a space equal to seven dots.
*/
/*
  short mark, dot or "dit" (.): "dot duration" is one time unit long
  longer mark, dash or "dah" (______): three time units long
  inter-element gap between the dots and dashes within a character: one dot duration or one unit long
  short gap (between letters): three time units long
  medium gap (between words): seven time units long
*/

/*
  DOT  = ONE UNIT
  DAST = 3 DOTS
  
  LETTER_SEPARTATOR= 3 DOTS
  WORD_SEPEARTION = 7 DOTS
*/

/*
#define QUAD_SECOND_DOT   4   // = 1/3 * 0.25 sec
#define HALF_SECOND_DOT   8   // = 1/3 * 0.50 sec
#define ONE_SECOND_DOT   16   // = 1/3 * 1.00 sec
#define TWO_SECOND_DOT   33   // = 1/3 * 2.00 sec

#define QUAD_SECOND_DASH 3 * QUAD_SECOND_DOT
#define HALF_SECOND_DASH 3 * HALF_SECOND_DOT
#define ONE_SECOND_DASH  3 * ONE_SECOND_DOT
#define TWO_SECOND_DASH  3 * TWO_SECOND_DOT

*/

#define QUAD_SECOND_DOT   1   //1/3 * 0.25 sec
#define HALF_SECOND_DOT   2   //1/3 * 0.50 sec
#define ONE_SECOND_DOT    3   //1/3 * 1.00 sec
#define TWO_SECOND_DOT    4   //1/3 * 2.00 sec

#define QUAD_SECOND_DASH 3 * QUAD_SECOND_DOT
#define HALF_SECOND_DASH 3 * HALF_SECOND_DOT
#define ONE_SECOND_DASH  3 * ONE_SECOND_DOT
#define TWO_SECOND_DASH  3 * TWO_SECOND_DOT


#define DASH_TIME HALF_SECOND_DASH // 0.2ms = 20 for dash (change this definition)
#define SPACE_TIME 7*dotTime

#define DOT  '.'
#define DASH '-'
#define SPACE '#'


extern unsigned dotTime;
extern unsigned dashTime;


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
void init_UART_pins_2();

void init_UART();
//void init_UART_2();


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

void LED_char_translate(char c);

void LED_string_translate(char *s);


#endif