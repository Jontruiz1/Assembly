INCLUDE Irvine32.inc

.data
row  dword ?
col  dword ?

.code
main PROC
	mov eax, 0
	mov edx, 0
	call Randomize
	call GetMaxXY			;al is rows, dl is cols

	mov row, eax
	mov col, edx


	mov ecx, 0
	L1: call Random32
		
		call RandPos
		call Gotoxy

		mov eax, 16
		call RandomRange
		call SetTextColor

		mov al, '1'
		call WriteChar

		mov eax, 1
		call Delay
	loop L1

	exit
main ENDP


RandPos PROC

	mov eax, row
	call RandomRange
	mov dh, al

	mov eax, col
	call Randomrange
	mov dl, al
	ret

RandPos ENDP
END main
