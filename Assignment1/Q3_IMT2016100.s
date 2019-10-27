	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION
	 MOV R1,#0x5  ;Number we want to give 
	 MOV R2,#0x2 ;store 2 in this register 
	UDIV R3,R1,R2  ;calculating remainder 
	MLS  R3,R3,R2,R1 ;If R3 is 1 then given number is odd and if R3 is 0 then number is even
stop  B stop; stop program 
ENDFUNC
END