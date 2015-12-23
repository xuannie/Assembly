;; HW #02
;; Alexis Chuah
;; 11 September 2015
;;
;; -------------------------------------------------------------
;; dogyears.asm
;; User enters name and age of dog.
;; Program will display dog's name and age in dog years. 
;; To assemble and run:
;; nasm -felf64 dogyears.asm && gcc dogyears.o && ./a.out
;; -------------------------------------------------------------

%include "dumpregs.asm"

		global main
		extern printf,scanf

		section .data

message:	db	"Enter dog name: ",0
messageage:	db	"Enter dog age: ",0
readname:	db	"%s",0
readage:	db	"%d",0
messageout:	db	"%s is %d years old.",10,0

		section .bss
name:		resb	80
age:		resd	1
dogage:		resd	1

		section .text

main:
		;printf("Enter dog name: ");
		mov 	rdi,message
		xor	rax,rax
		call	printf
	
		;scanf("%s",name);
		mov	rdi,readname
		mov	rsi,name
		xor	rax,rax
		call	scanf

		;printf("Enter dog age: ");
		mov	rdi,messageage
		xor	rax,rax
		call	printf
		
		;scanf("%d",age);
		mov	rdi,readage
		mov	rsi,age
		xor	rax,rax
		call	scanf
		
		;dump_regs
				
		;multiplication
		imul	edi,[age],7	;Multiply age by 7 in edi
		mov	[dogage],edi	;move value into dogage		
		xor	rax,rax		
		;dump_regs

		;printf("%s is %d years old");
		mov	rdi,messageout	;param 1 - message
		mov	rsi,name	;param 2 - dog name
		mov	rdx,[dogage]	;param 3 - dog age
		xor	rax,rax		
		call	printf
