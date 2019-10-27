	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION
	 MOV R0,#0x5  ;Number a
	 MOV R1,#0x7  ;Number b
	 
while  CMP R0,R1      ;	Comparing number a and (loop starting)
	BLT LOOP1     ; a<b go to loop1 
	BEQ LOOP2    ;a=b go to loop2
    SUB R0,R1      ;a>b a-b
	B while 
LOOP1	SUB R1,R0  ;b-a
    B while             ;goes to while 
LOOP2 MOV R2,R1    ;stores answer in R2 
	B stop 
stop  B stop; stop program 
ENDFUNC
END