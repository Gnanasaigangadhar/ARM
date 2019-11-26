		THUMB 
		AREA     appcode, CODE, READONLY
		EXPORT __main
		ENTRY

__main function
		VLDR.F32 s13, =1.0 			; cos =1

		VLDR.F32 s0, =1.0471975512 	; C = x

		VMOV.F32 s14,s0 			; sine =x 

		VMOV.F32 s1,s0 				; B = x 

		MOV r5,#0x1					

		MOV r6,#0x1					

		MOV r7,#0x1					

		VLDR.F32 s4, =1.0 			; add_factor

		VLDR.F32 s3, =2.0 			; mul_factor(n)	

		VLDR.F32 s2, =0.0 			;initialize final value



		

mainloop VMOV.F32 s8,s2			;tan x copy

		      VDIV.F32 s5,s0,s3 			; C = x/n
				cmp r5, #1

				bne loop2

				cmp r6, #1

				bne loop3

				VFMS.F32 s13,s1,s5 ; A = A - BC

				VMUL.F32 s1,s1,s5 ; B = B*C

				MOV r6,#0x0

				MOV r5,#0x0

				b loop1

loop3		VFMA.F32 s13,s1,s5 ; A = A + BC

				VMUL.F32 s1,s1,s5 ; B = B*C

				MOV r6,#0x1

				MOV r5,#0x0	

				b loop1



loop2

			 cmp r7, #1

			 bne loop4

			VFMS.F32 s14,s1,s5 	; A = A - BC

			VMUL.F32 s1,s1,s5 	; B = B*C

			MOV r7,#0x0

			MOV r5,#0x1

			b loop1

loop4

			VFMA.F32 s14,s1,s5 	; A = A + BC

			VMUL.F32 s1,s1,s5 	; B = B*C

			MOV r7,#0x1

		    MOV r5,#0x1	

			b loop1

			

loop1	VADD.F32 s3,s3,s4 			; n = n+1	 

			VDIV.F32 s2,s14,s13 		; tan=sin/cos

			VCMP.F32 s8,s2

			VMRS APSR_nzcv, FPSCR

			BNE mainloop

		 

		 ;check answer in S2

stop B stop ; stop program

	 ENDFUNC

	  END