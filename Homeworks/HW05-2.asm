INCLUDE Irvine32.inc

ASIZE = 5

COMMENT !

	Write a program that will:
	1. Enter five numbers and calculate their average.
	2. Call a procedure that calculates a letter grade based on a scale of 90-80-70-60 for an A, B, C, D.
	3. Display the original scores, the average, and the letter grade.
	4. Repeat steps 1 - 4 until the user gets bored and says stop.

!
.data
	grades BYTE ASIZE dup(?)
	str1 BYTE "Enter a grade: ", 0
	str2 BYTE "The Average Score is: ", 0
	str3 BYTE "The Original Scores are: ", 0
	str4 BYTE " ",0
	str5 BYTE "The Average Letter Grade is: ", 0
	str6 BYTE "Enter an int < 1 to stop: ", 0

	sum DWORD ?
	row BYTE ?
	col BYTE ?

.code
main PROC

	MainL:
		call ClrScr
		mov row, 0
		mov col, 20

		call Readin
		call CalcAvg
		call DisplayLetterGrade
		call DisplayOScores
		call Continue
		cmp al, 1
		jb TERMINATE

	loop MainL

	TERMINATE:
	exit

main ENDP

Continue PROC
	mov eax, 0
	add row, 1
	call Locate
	mov edx, OFFSET str6
	call WriteString

	call ReadInt

	ret

Continue ENDP



DisplayLetterGrade PROC		; I wanted to keep it authentic so I didn't use the IF directive
	mov edx, 0
	mov edx, OFFSET str5
	call WriteString

	cmp al, 90				; if score >= 90
	jbe NEXT1
	mov eax, 0
	mov eax, 'A'			; move 'A' into eax and go to display it
	jmp STOP

	NEXT1:
	cmp al, 80				; if score >= 80
	jbe NEXT2
	mov eax, 0
	mov eax, 'B'			; move 'B' into eax and go to display it
	jmp STOP

	NEXT2:
	cmp al, 70				; if score >= 70
	jbe NEXT3
	mov eax, 0
	mov eax, 'C'			; move 'C' into eax and go to display it 
	jmp STOP

	NEXT3:	
	cmp al, 60				; if score >= 60
	jbe NEXT4
	mov eax, 0
	mov eax, 'D'			; move 'D' into eax and go to display it
	jmp STOP

	NEXT4:
	mov eax, 0				; otherwise, just set eax to 'F'
	mov eax, 'F'

	STOP:
	call WriteChar			; display char
	ret
DisplayLetterGrade ENDP


CalcAvg PROC
	; 100 + 54 + 76 + 87 + 54
	; 100 + 23 + 43 + 65 + 45
	
	call ClrScr
	mov eax, 0				; just zeroing out registers
	mov edx, 0				
	mov ebx, ASIZE			; prepare dividend

	mov row, 0				; resetting where the cursor is
	mov col, 20				
	call Locate				; moving the cursor over


	mov edx, OFFSET str2	; prepare string
	call WriteString

	mov eax, sum			; prepare dividend
	div bl					; divide by 5
	mov ah, 0				; rid of divisor


	call WriteInt
	add row, 1
	call Locate
	ret

CalcAvg ENDP

DisplayOScores PROC
	mov ebx, 0
	mov ecx, ASIZE
	add row, 1
	call Locate
	mov edx, OFFSET str3
	call WriteString

	Display:
		mov eax, 0
		mov edx, 0
		mov al, [grades+ebx]
		call WriteDec
	
		mov edx, OFFSET str4
		call WriteString

		add ebx, 1
		
	loop Display

	ret
DisplayOScores ENDP


Readin PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, ASIZE
	mov sum, 0

	Read:
		mov eax, 0
		call Input
		mov [grades+ebx], al
		add sum, eax
		add row, 1
		add ebx, 1
	loop Read
	ret
Readin ENDP

; input an integer
Input PROC
	call Locate
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	ret
Input ENDP

; locate the cursor
Locate PROC
	mov  dh,row
	mov  dl,col
	call Gotoxy
	ret
Locate ENDP

END main