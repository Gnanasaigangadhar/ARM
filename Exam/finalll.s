	PRESERVE8 
    THUMB 
    AREA    |.text|,CODE,READONLY 
	IMPORT printMsg
    EXPORT __main 
    ENTRY 
	
	EXPORT __sine	 
__sine function	
	
		VLDR.F32 S13,=3.14592 ; Pi value
		VLDR.F32 S14,=180 ;  180 degress
		VMOV.F32 S0,R4; 
        VCVT.F32.U32 S0, S0;
		VMUL.F32 S0,S0, S13
		VDIV.F32 S0,S0, S14 ;angle into radians
		MOV R1,#10;
		MOV R2,#0; incrementing 
		VLDR.F32 S7,=1.0; 
		VMOV.F32 S1,S0;  temp variables
		VMOV.F32 S10,S0; First element in  sinx  series is x
		VMOV.F32 S6,#-1.0; 
		VLDR.F32 S8,=2.0;
		VLDR.F32 S9,=1.0;
		
		
loop1	VMUL.F32 S3,S1,S6;  multiplying x with -1
		VMUL.F32 S3,S3,S0;	 multiplying with x^2
		VMUL.F32 S3,S3,S0;
		VMUL.F32 S4,S7,S8;     odd multiples
		VADD.F32 S5,S4,S9;
		VMUL.F32 S4,S4,S5;	
		VDIV.F32 S1,S3,S4;	                all elements  in  the series
		VADD.F32 S10,S10,S1;	         Sum 
		VADD.F32 S7,S7,S9; Updating .
		ADD R2,R2,#1;
		CMP R1,R2;
		BNE loop1
		
		B __cos
		LTORG
		ENDFUNC

	EXPORT __cos
__cos function	
	
		MOV R2,#0;Counter
		VLDR.F32 S7,=1.0;temp variables and constants
		VMOV.F32 S1,S7;
		VMOV.F32 S11,S7;	
		
loop2	VMUL.F32 S3,S1,S6; multiplying x with -1
		VMUL.F32 S3,S3,S0;	multiplying with x^2
		VMUL.F32 S3,S3,S0;
		VMUL.F32 S4,S7,S8;        odd multiples
		VSUB.F32 S5,S4,S9;
		VMUL.F32 S4,S4,S5;
		VDIV.F32 S1,S3,S4;  all elements in  the series
		VADD.F32 S11,S11,S1; Sum
		VADD.F32 S7,S7,S9;  Updating 
		ADD R2,R2,#1;
		CMP R1,R2;
		BNE loop2
		
		B loo1
		LTORG
		ENDFUNC
		

__main    FUNCTION 
	VLDR.F32 S20,=100	; Value of the radius
	VLDR.F32 S0,=0		
	MOV R11,#1			; Increment angle each time by this value
	MOV R10,#360		; Do the incrementing till 360 degress
	MOV R4,#0          ; 
	
loop4
		B __sine
		B __cos
		
loo1	
		VMUL.F32 S10,S20; Rsinx
		VMUL.F32 S11,S20; Rcosx
		VLDR.F32 S16,=319; X1
		VADD.F32 S11,S16 ;  X1+Rcosx
		VLDR.F32 S16,=239;   Y1
		VADD.F32 S10,S16;    Y1+Rsinx
		VMOV.F32 R0,S11     
		VMOV.F32 R1,S10
		BL printMsg
		ADD R4,R11
		CMP R4,R10;
		BLT loop4      ;again goes to first and increments the degrees and prints the coordinates .
		BEQ Stop
				 
		
Stop B Stop ; Stop program
     ENDFUNC
	 END