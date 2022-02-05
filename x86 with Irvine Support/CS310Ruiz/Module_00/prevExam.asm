INCLUDE Irvine32.inc

.data
	byte01 byte "ABC"			; 1 byte per, each letter takes 1 byte
	sword1 sdword 10			; 4 bytes per
	dword1 dword 123			; 4 bytes per
	word1 word 12h				; 2 bytes per
	byte02 byte "123"			; 1 byte per, each letter takes 1 byte

	sum dword ?
.code

main PROC
	mov eax, 0
	add eax, sizeof byte01
	add eax, sizeof sword1
	add eax, sizeof dword1
	add eax, sizeof word1
	add eax, sizeof byte02

	mov ecx, 6
	mov edx, 1
	mov ebx, 1

	L1:
		mov esi, edx
		add esi, ebx
		mov ebx, edx
		mov edx, esi
		mov eax, esi
	loop L1
	
	call dumpregs
	exit
main ENDP

END main