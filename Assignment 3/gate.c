#include "STM32f4xx.h"
void printGate(const int a)
{
	 char *ptr_n;
	 
	 if(a==0){ ptr_n = "LogicAND\n"; }
	 if(a==1){ ptr_n = "Logic OR\n"; }
	 if(a==2){ ptr_n = "Logic NAND\n"; }
	 if(a==3){ ptr_n = "Logic NOR\n"; }
	 if(a==4){ ptr_n = "Logic XOR\n"; }
	 if(a==5){ ptr_n = "Logic XNOR\n"; }
	 if(a==6){ ptr_n = "Logic NOT\n"; }
	
	 while(*ptr_n != '\0'){
      ITM_SendChar(*ptr_n);
      ++ptr_n;
   }
	 return;
}
