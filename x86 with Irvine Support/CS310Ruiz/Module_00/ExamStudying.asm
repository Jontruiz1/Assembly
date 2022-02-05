INCLUDE Irvine32.inc

.data

	VAR01 DWORD 10, 20
          WORD 30, 40
          BYTE 50, 60
	VAR02 DWORD 70,80

	dalooper byte 3
	
	var1 sdword 3
	var2 sdword 4
	var3 sdword 5
	var4 sdword 2
	var5 sdword 1

	str1 byte "This is an easy string", 0Ah
	str2 byte "This is not an easy string"

.code
main PROC
	comment @
	mov eax, 0
	mov al, byte ptr [var2-2]
	call dumpregs
	call waitmsg

	mov ecx, dword ptr [dalooper]
	mov ebx, 2
	L1:
		add eax, ebx
		add ebx, 1
		call dumpregs
	loop L1

	call waitmsg
	

	mov eax, 0
	mov ebx, var2
	sub ebx, var1

	mov var1, ebx
	mov ax, word ptr [var1]
	mul var3

	add eax, var4
	sub eax, var5
	

	call dumpregs
	call waitmsg
	@

	mov edx, offset str1
	call writestring
	mov edx, offset str2


	exit
	
main ENDP

END main