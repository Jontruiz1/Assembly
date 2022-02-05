INCLUDE Irvine32.inc

ASIZE = 5

.data
    grades word ASIZE dup(?)
    str1 BYTE "Enter an integer(or say stop): ",0
    str2 BYTE "The Average is: ", 0
    str3 BYTE "Original Scores: ", 0
    str4 BYTE " "
    str5 BYTE ?

    sum word 0
    avg word  ?             ; never above 500
    row  BYTE ?
    col  BYTE ?

.code


main PROC

Mainl:
COMMENT !
    Write a program that will:
    1. Enter five numbers and calculate their average.
    2. Call a procedure that calculates a letter grade based on a scale of 90-80-70-60 for an A, B, C, D.
    3. Display the original scores, the average, and the letter grade.
    4. Repeat steps 1 - 4 until the user gets bored and says stop.

    100 50 40 76 56

!

    call Clrscr
    mov row, 0
    mov col, 20

    call Locate
    call ReadIn
    call CalcAvg
    call AverageDisplay
    call DisplayOScores
    call Waitmsg

loop  Mainl

    exit
    
main ENDP

DisplayLetterGrade PROC

    cmp avg, 100
    cmp avg, 90
    cmp avg, 80
    cmp avg, 70
    cmp avg, 60
    cmp avg, 50

DisplayLetterGrade ENDP


DisplayOScores PROC
    mov eax, 0
    mov ebx, 0                ;            Counting Variable

    call Locate
    mov edx, offset str3
    call WriteString
    add row, 1
    mov ecx, ASIZE            ;            Moving the size of the array into ecx to loop that many elements

    L3:
        
        mov ax, [grades + ebx]
        call WriteDec
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
    mov eax, 0                ;            0ing out eax for writing the strings and ints    
    mov ax, avg               ;            Moving the average into ax to write it 

    add row, 1                ;            Moving cursor
    call Locate

    mov edx, offset str2    ;            Moving the offset of str2 just to write it
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
    mov ebx, ASIZE
    div bl

    mov avg, ax
    call writeint
    call waitmsg
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
        add ebx, 2
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