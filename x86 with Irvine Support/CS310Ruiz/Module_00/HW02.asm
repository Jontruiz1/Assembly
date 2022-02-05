INCLUDE Irvine32.inc
.data
varA SDWORD 5
varB SDWORD 10
varC SDWORD 3
varD SDWORD 6
.code
main PROC
	call Zero

	mov eax, varA
	mov ebx, varB
	mov ecx, varC
	mov edx, varD
	call DumpRegs

	add eax, ebx     ; (A + B), eax has result
	add ecx, edx     ; (C + D), ecx has result
	sub eax, ecx     ; (A+B) - (C+D), stored in eax

	mov varA, eax
	
	call DumpRegs

	exit
main ENDP

Zero PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	call DumpRegs
	ret
Zero ENDP

END main