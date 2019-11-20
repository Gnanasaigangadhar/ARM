     AREA     appcode, CODE, READONLY
	 IMPORT printMsg
	 IMPORT printGate
	 IMPORT printLine
	 EXPORT __sigmoid 
	
__sigmoid function
	  VLDR.F32 s0, =1.0 ; sum A
	  VLDR.F32 s1, =1.0 ; B
	  ;VLDR.F32 s2, =9.0; C = x
	  VLDR.F32 s3, =1.0 ; multiplication
	  VLDR.F32 s4, =1.0 ; incrementing 
loop VMOV.F32 s6,s0
	   VDIV.F32 s5,s2,s3 ; C = x/n
	   VADD.F32 s3,s3,s4 ; n = n+1
	   VFMA.F32 s0,s1,s5 ; A = A + BC
	   VMUL.F32 s1,s1,s5 ; B = B*C
	   VCMP.F32 s6,s0
	  VMRS APSR_nzcv, FPSCR
	  BNE loop
	  
	  VADD.F32 S0,S4;
	  VDIV.F32 S7,S6,S0;
	  BX lr
	  LTORG
	  ENDFUNC
	  
	  EXPORT __logic_and 
__logic_and  function 
	MOV r5,r14
	
	VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	VLDR.F32 s8, =1.0; weight1
	VLDR.F32 s9, =1.0;weight2
	VLDR.F32 s10, =1.0;weight3
	VLDR.F32 s11, =-2.0;weight4(bias weight which is helpful for finding output easily)
	
	VCVTR.S32.F32 s15,s28;  converting input into float value 
	VCVTR.S32.F32 s16,s29;  converting input into float value 
    VCVTR.S32.F32 s17,s30 ;  converting input into float value 
	
	VMUL.F32 s8,s28 ; w1*x1
	VMUL.F32 s9,s29 ; w2*x2
	VMUL.F32 s10,s30 ; w3*x3
	VMUL.F32 s11,s13 ; w4*x4
	 
	 ;w1*x1+w2*x2+w3*x3+w4*x4
	 
	 VADD.F32 s8,s9;
	 VADD.F32 s8,s10;
	 VADD.F32 s8,s11;
	 
	 VMOV.F32 s2,s8;  sum goes as x in sigmoid function 
	 
	 BL  __sigmoid 
	 VCVTR.S32.F32 s23,s7 
	 VMOV.F32 r0,s15
	 BL printMsg
	 VMOV.F32 r0,s16
	  BL printMsg
	 VMOV.F32 r0,s17
	  BL printMsg
	 VMOV.F32 r0,s23
	  BL printMsg
	  BL printLine 
	  
	  MOV r14,r5
	  BX lr
	  LTORG 
	  
	  ENDFUNC
	  
	  	  EXPORT __logic_or 
__logic_or  function
	MOV r5,r14
	
	VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	VLDR.F32 s8, =2.0; weight1
	VLDR.F32 s9, =2.0;weight2
	VLDR.F32 s10, =2.0;weight3
	VLDR.F32 s11, =-1.0;weight4(bias weight which is helpful for finding output easily)
	
	VCVTR.S32.F32 s15,s28;  converting input into float value 
	VCVTR.S32.F32 s16,s29;  converting input into float value 
    VCVTR.S32.F32 s17,s30 ;  converting input into float value 
	
	VMUL.F32 s8,s28 ; w1*x1
	VMUL.F32 s9,s29 ; w2*x2
	VMUL.F32 s10,s30 ; w3*x3
	VMUL.F32 s11,s13 ; w4*x4
	 
	 ;w1*x1+w2*x2+w3*x3+w4*x4
	 
	 VADD.F32 s8,s9;
	 VADD.F32 s8,s10;
	 VADD.F32 s8,s11;
	 
	 VMOV.F32 s2,s8;  sum goes as x in sigmoid function 
	 
	 BL  __sigmoid 
	 VCVTR.S32.F32 s24,s7 
	 VMOV.F32 r0,s15
	 BL printMsg
	 VMOV.F32 r0,s16
	  BL printMsg
	 VMOV.F32 r0,s17
	  BL printMsg
	 VMOV.F32 r0,s24
	  BL printMsg
	  BL printLine 
	  
	  MOV r14,r5
	  BX lr
	  LTORG 
	  
	  ENDFUNC
	  
	  EXPORT __logic_nand 
__logic_nand  function
	MOV r5,r14
		VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	VLDR.F32 s8, =-1.0; weight1
	VLDR.F32 s9, =-1.0;weight2
	VLDR.F32 s10, =-1.0;weight3
	VLDR.F32 s11, =3.0;weight4(bias weight which is helpful for finding output easily)
	
	VCVTR.S32.F32 s15,s28;  converting input into float value 
	VCVTR.S32.F32 s16,s29;  converting input into float value 
    VCVTR.S32.F32 s17,s30 ;  converting input into float value 
	
	VMUL.F32 s8,s28 ; w1*x1
	VMUL.F32 s9,s29 ; w2*x2
	VMUL.F32 s10,s30 ; w3*x3
	VMUL.F32 s11,s13 ; w4*x4
	 
	 ;w1*x1+w2*x2+w3*x3+w4*x4
	 
	 VADD.F32 s8,s9;
	 VADD.F32 s8,s10;
	 VADD.F32 s8,s11;
	 
	 VMOV.F32 s2,s8;  sum goes as x in sigmoid function 
	 
	 BL  __sigmoid 
	 VCVTR.S32.F32 s25,s7 
	 VMOV.F32 r0,s15
	 BL printMsg
	 VMOV.F32 r0,s16
	  BL printMsg
	 VMOV.F32 r0,s17
	  BL printMsg
	 VMOV.F32 r0,s25
	  BL printMsg
	  BL printLine 
	  
	  MOV r14,r5
	  BX lr
	  LTORG 
	  
	  ENDFUNC
	  
	  
	  EXPORT __logic_nor
__logic_nor function
	MOV r5,r14
			VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	VLDR.F32 s8, =-2.0; weight1
	VLDR.F32 s9, =-2.0;weight2
	VLDR.F32 s10, =-2.0;weight3
	VLDR.F32 s11, =1.0;weight4(bias weight which is helpful for finding output easily)
	
	VCVTR.S32.F32 s15,s28;  converting input into float value 
	VCVTR.S32.F32 s16,s29;  converting input into float value 
    VCVTR.S32.F32 s17,s30 ;  converting input into float value 
	
	VMUL.F32 s8,s28 ; w1*x1
	VMUL.F32 s9,s29 ; w2*x2
	VMUL.F32 s10,s30 ; w3*x3
	VMUL.F32 s11,s13 ; w4*x4
	 
	 ;w1*x1+w2*x2+w3*x3+w4*x4
	 
	 VADD.F32 s8,s9;
	 VADD.F32 s8,s10;
	 VADD.F32 s8,s11;
	 
	 VMOV.F32 s2,s8;  sum goes as x in sigmoid function 
	 
	 BL  __sigmoid 
	 VCVTR.S32.F32 s26,s7 
	 VMOV.F32 r0,s15
	 BL printMsg
	 VMOV.F32 r0,s16
	  BL printMsg
	 VMOV.F32 r0,s17
	  BL printMsg
	 VMOV.F32 r0,s26
	  BL printMsg
	  BL printLine 
	  
	  MOV r14,r5
	  BX lr
	  LTORG 
	  
	  ENDFUNC
	  
	  EXPORT __logic_not
__logic_not function
	MOV r5,r14
	VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	VLDR.F32 s8, =-2.0; weight1
	VLDR.F32 s11, =1.0;weight4(bias weight which is helpful for finding output easily)
	
	VCVTR.S32.F32 s15,s28;  converting input into float value 
	VCVTR.S32.F32 s16,s29;  converting input into float value 
    VCVTR.S32.F32 s17,s30;
	;  converting input into float value 
	
	VMUL.F32 s8,s28 ; w1*x1
	VMUL.F32 s11,s13 ; w4*x4
	 
	 ;w1*x1+w4*x4
	 
	 VADD.F32 s8,s11;
	 
	 VMOV.F32 s2,s8;  sum goes as x in sigmoid function 
	 
	 BL  __sigmoid 
	 VCVTR.S32.F32 s26,s7 
	 VMOV.F32 r0,s15
	 BL printMsg
	 ;VMOV.F32 r0,s16
	  ;BL printMsg
	 ;VMOV.F32 r0,s17
	  ;BL printMsg
	 VMOV.F32 r0,s26
	  BL printMsg
	  BL printLine 
	  
	  MOV r14,r5
	  BX lr
	  LTORG 
	  
	  ENDFUNC
	  
	  EXPORT __logic_xor
__logic_xor function
	   MOV r5,r14
	   VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	   VLDR.F32 s8, =-2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =-2.0
	   VLDR.F32 s11, =-1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
       BL __sigmoid ; for xor multiple nueral layers 
	    VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =-2.0
	   VLDR.F32 s10, =-2.0
	   VLDR.F32 s11, =-1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   


	   
       BL __sigmoid ;for xor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	  	VLDR.F32 s8, =-2.0
	   VLDR.F32 s9, =-2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11, =--1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
	   
       BL __sigmoid ;for xor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11, =-5.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
	   
       BL __sigmoid ;for xor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s21,s6
	   VCVT.F32.S32 s21,s21
	   
	   VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11,=-1.0
	   VLDR.F32 s12, =2.0
	   
	   	VMUL.F32 s8,s18 ; w1*x1
	   VMUL.F32 s9,s19 ; w2*x2
	   VMUL.F32 s10,s20 ; w3*x3
	   VMUL.F32 s12,s21 ; w3*x3
	   VMUL.F32 s11,s13 ; w5*bias
	   
	   VADD.F32 s8,s9 ;
	   VADD.F32 s8,s10 ;
	   VADD.F32 s8,s11;
	   VADD.F32 s8,s12;
	   
	   VMOV.F32 s2,s8;

	   

	   
	   
       BL __sigmoid ; output
	   VCVTR.S32.F32 s26,s7
	   VMOV.F32 r0,s15
	   BL printMsg
	   VMOV.F32 r0,s16
	   BL printMsg
	   VMOV.F32 r0,s17
	   BL printMsg
	   VMOV.F32 r0,s26
	   BL printMsg
	   BL printLine
	   
	   MOV r14,r5
	   BX lr
	   LTORG

	   ENDFUNC
	   
	   	  EXPORT __logic_xnor
__logic_xnor function
	   MOV r5,r14
	   VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	
	   VLDR.F32 s8, =-2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11, =1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
       BL __sigmoid ;for xnor multiple nueral layers 
	    VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =-2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11, =1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   


	   
       BL __sigmoid ;for xnor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	  	VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =-2.0
	   VLDR.F32 s11, =1.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
	   
       BL __sigmoid ;for xnor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s8, =-2.0
	   VLDR.F32 s9, =-2.0
	   VLDR.F32 s10, =-2.0
	   VLDR.F32 s11, =5.0	
	   
	   VCVTR.S32.F32 s15,s28
	   VCVTR.S32.F32 s16,s29
	   VCVTR.S32.F32 s17,s30
	   

	   
	   VMUL.F32 s8,s28 ; w1*x1
	   VMUL.F32 s9,s29 ; w2*x2
	   VMUL.F32 s10,s30 ; w3*x3
	   VMUL.F32 s11,s13 ; w4*bias
	   
	   VADD.F32 s8,s9
	   VADD.F32 s8,s10
	   VADD.F32 s8,s11
	   
	   VMOV.F32 s2,s8
	   
	   
       BL __sigmoid ;for xnor multiple nueral layers 
	     VLDR.F32 s13, =1.0; x4 corresponding to bias weight 
	   VCVTR.S32.F32 s21,s6
	   VCVT.F32.S32 s21,s21
	   
	   VLDR.F32 s8, =2.0
	   VLDR.F32 s9, =2.0
	   VLDR.F32 s10, =2.0
	   VLDR.F32 s11,=-7.0
	   VLDR.F32 s12, =2.0
	   
	   	VMUL.F32 s8,s18 ; w1*x1
	   VMUL.F32 s9,s19 ; w2*x2
	   VMUL.F32 s10,s20 ; w3*x3
	   VMUL.F32 s12,s21 ; w3*x3
	   VMUL.F32 s11,s13 ; w5*bias
	   
	   VADD.F32 s8,s9 ;
	   VADD.F32 s8,s10 ;
	   VADD.F32 s8,s11;
	   VADD.F32 s8,s12;
	   
	   VMOV.F32 s2,s8;

	   

	   
	   
       BL __sigmoid ;output
	   VCVTR.S32.F32 s31,s7
	   VMOV.F32 r0,s15
	   BL printMsg
	   VMOV.F32 r0,s16
	   BL printMsg
	   VMOV.F32 r0,s17
	   BL printMsg
	   VMOV.F32 r0,s31
	   BL printMsg
	   BL printLine
	   
	   MOV r14,r5
	   BX lr
	   LTORG

	   ENDFUNC
	
	  
	  
	  
	  EXPORT __main
	  
__main  function		 
	  
	   MOV r0,#0
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	  
	   BL __logic_and
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	  
	   BL __logic_and
	   
	   
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	  
	   BL __logic_and
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	  
	   BL __logic_and
	   
	   
	   MOV r0,#1
	   BL printGate
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_or
	   
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_or
	   
	   	VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_or
	   
	   	VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_or
	   
	   MOV r0,#2
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_nand
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_nand
	   
	   	VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_nand
	   
	   	VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_nand
	   
	   
	   MOV r0,#3
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_nor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_nor
	   
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_nor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_nor
	   
	   	   MOV r0,#4
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_xor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_xor
	   
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_xor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_xor
	   
	   	   	   MOV r0,#5
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_xnor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_xnor
	   
	   VLDR.F32 s28, =1.0 ; x1
	   VLDR.F32 s29, =1.0 ; x2
	   VLDR.F32 s30, =1.0 ; x3
	   
	   BL __logic_xnor
	   
	   VLDR.F32 s28, =0.0 ; x1
	   VLDR.F32 s29, =0.0 ; x2
	   VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_xnor
	   

	   
	   	   MOV r0,#6
	   BL printGate
	   VLDR.F32 s28, =1.0 ; x1
	  ; VLDR.F32 s29, =0.0 ; x2
	   ;VLDR.F32 s30, =0.0 ; x3
	   
	   BL __logic_not
	   
	   
	   
	  
	   
stop B stop ; stop program

		ENDFUNC

     END
	  

	
	  
	  
	
	  
	  
	  
	  
	 
	 
	 
	 
	 
   
	
	
	
	
	;
	
	
	
	
	