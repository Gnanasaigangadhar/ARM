	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION
	 MOV R0,#0x5  ;Number one 
	 MOV R1,#0x7  ;Number two
	 MOV R2,#0x1  ;Number three 
	 
	 CMP R0,R1      ;	Comparing number one and two 
	 ITE LT
	 MOV R3,R0
	 CMP R3,R2
	 ITE  LT
	 MOV R3,R2
	 B stop
stop  B stop; stop program 
ENDFUNC
END
; i am comparing everytime two numbers and storing in another register and it is not running.