	   THUMB 

       AREA appcode,CODE,READONLY

       EXPORT __main

		      ENTRY

__main FUNCTION 

	   MOV R0,#0 ;F(0) 

	   MOV R1,#1 ;F(1)

	   MOV R2,#7  ;total no of fibonacci numbers we want 

	   MOV R3,#0x20000000 ; storing that value in R3 
 
	   STR R0,[R3]               ; storing f(0) in address of R3

	   STR R1,[R3,#0x1] !       ;Storing f(1) in address of R3+1

	

LOOP CMP R2,#0x00000002

	   SUB R2,R2,#1 

	   ADD R4,R0,R1

	   STR R4,[R3,#0x1]!

	   MOV R0,R1

	   MOV R1,R4

	   BGT LOOP

;Abov loop everytime f(n)= f(n-1)+f(n-2) and storing value by incrementing the address which we took initially .	

stop B stop; stop program 

	   ENDFUNC

	   END