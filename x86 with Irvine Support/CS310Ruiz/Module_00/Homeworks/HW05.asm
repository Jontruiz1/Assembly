INCLUDE Irvine32.inc

ASIZE = 4

.data
	grades word ASIZE dup(?)
	str1 BYTE "Enter an integer(or say stop): ",0
	str2 BYTE "The Average is: ", 0
	str3 BYTE "Original Scores: ", 0
	str4 BYTE " " 

	sum word 0
	avg byte ?
	row  BYTE ?
	col  BYTE ?

.code
main PROC

Mainl:

	mov eax, 0
	mov sum, 0
	mov avg, 0

	call Clrscr
	mov row, 0
	mov col, 20

	call Locate
	call ReadIn
	call CalcAvg
	call AverageDisplay
	call DisplayOScores
	call WaitMsg



loop  Mainl

	exit
	
main ENDP

DisplayOScores PROC

    call Locate
    mov edx, offset str3
    call WriteString
    add row, 1

    mov ecx, ASIZE            ;            Moving the size of the array into ecx to loop that many elements
	mov ebx, 0                ;            Counting Variable
    L3:
		mov eax, 0
		mov edx, 0
        mov eax, 0
        mov ax, [grades + ebx] 
        call WriteInt

        mov edx, offset str4
        call WriteString
        add ebx, 2
    loop L3

    add row, 1
	call Locate

    ret

DisplayOScores ENDP

AverageDisplay PROC
	call ClrScr
	mov eax, 0				;			0ing out eax for writing the strings and ints	
	mov al, avg				;			Moving the average into ax to write it 5

	call Locate
	mov edx, offset str2	;			Moving the offset of str2 just to write it
	call WriteString
	call WriteInt
	add row, 1
	call Locate
	ret
AverageDisplay ENDP

CalcAvg PROC
	mov eax, 0
	mov ebx, 0
	mov ax, sum
	mov bl, ASIZE
	div bl

	mov avg, al
	ret
CalcAvg ENDP

ReadIn PROC
	mov ecx, ASIZE
	mov ebx, 0

	Read:
		mov eax, 0
		add row, 1
		call Input
		mov [grades + ebx], ax
		add sum, ax
		add bl, 2
	loop Read

	ret
ReadIn ENDP

Input PROC
	call Locate
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	ret
Input ENDP

Locate PROC
	mov  dh,row
	mov  dl,col
	call Gotoxy
	ret
Locate ENDP

END main
