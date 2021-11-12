INCLUDE Irvine32.inc

.data
str1 BYTE "Enter an integer: ",0
str2 BYTE "The sum is:       ",0
str3 BYTE "Press any key...  ",0

sum  SDWORD 0
row  BYTE ?
col  BYTE ?
.code

main PROC
comment @
Write the code necessary to input a value from the keyboard, set the register EAX = 0, 
create a loop that runs x-number of times, where x is the value oftheinput variable, 
add 1 to eax the first time throught the loop, 2 the second time through the loop, 3 the third time etc...

Hint: Use Readint to input a value? The input from that macro is stored in eax. Output the results.
@


call Input
mov ecx, eax
mov eax, 0
mov ebx, 0

L1:
add ebx, 1
add eax, ebx
loop L1

call Input
call clrscr
call dumpregs

exit
main ENDP


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