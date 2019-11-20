#include "STM32f4xx.h"
void printLine()
{
	 char ptr_n[5] = "\n";
	 ITM_SendChar(*ptr_n);
	 return;
}
