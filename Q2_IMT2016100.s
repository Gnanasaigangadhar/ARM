	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION
	 MOV R0,#0x5  ;Number one 
	 MOV R1,#0x7  ;Number two
	 MOV R2,#0x1  ;Number three 
	 
	 CMP R0,R1      ;	Comparing number one and two 
	 BLT LOOP1     ; R0<R1 go to loop1
	 BEQ LOOP2    ;R0=R1 go to loop2
	 CMP R0,R2      ;This will happen when R0>R1 ,it will compare R0 and R2 
	 BLT LOOP3     ; R0<R2 go to loop3 
	 MOV R5,R0      ;R0>R2 Store R0 in R5
	 B stop
	 
LOOP1	CMP R1,R2   ;Compare number two and three
	BLT LOOP3       ;R1<R2 go to loop3
	MOV R5,R1       ;R1>R2 stores R1 in R5 
	B stop 
LOOP2 CMP R0,R2  ;Compare number 1 and number 3
	BLT LOOP3         ;R0<R2 go to loop3
	MOV R5,R0          ;R0>R2 stores R0 in R5
	B stop 
LOOP3	MOV R5,R2   ;Stores R2 in R5 
stop  B stop; stop program 
ENDFUNC
END