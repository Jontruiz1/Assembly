INCLUDE Irvine32.inc
	COMMENT !
		Write the code necessary to input an 
		hours worked and a rate of pay from the console.
		Call an internal procedure to calculate total pay.
		From the main routine, display the total pay on the
		console. The following additional rules apply:

		Use appropriate prompts to tell the user what to enter.

		Use appropriate output messages to indicate the calculation 
		that was performed
		
		You may assume that all values are integers.

		For the calc of total pay, if hours worked are <= 40, total pay
		= hours * rate. If hours >= 40, first 40 hours are calculated as
		regular pay as indicated above and hours over 40 hours are triple time,
		i.e hours worked times rate of pay times 3
	!



.data

	str1 BYTE "Input hours worked: ", 0
	str2 BYTE "Input rate of pay: ", 0
	str3 BYTE "Triple Time occurred, hours above 40 multiplied by 3 ", 0
	str4 BYTE "Total pay is: ", 0
	

	row BYTE 1
	col BYTE 20

	hours dword ?
	rate dword ?


.code

main PROC
	mov eax, 0					; resetting eax

	call Locate					; positioning cursor to 1, 20
	mov edx, OFFSET str1		; loading first string
	call WriteString			; writing first string
	call ReadInt				; asking for input

	mov hours, eax				; loading eax into rate
	mov eax, 0					; resetting eax just in case

	inc row						; go down one row
		
	call Locate					; positioning cursor down one
	mov edx, OFFSET str2		; loading second string
	call WriteString			; writing second string
	Call ReadInt				; asking for input

	mov rate, eax				; loading eax into rate
	mov eax, 0					; resetting eax just in case

	add row, 2					; go down one row
	call Locate					; positioning cursor down one

	
	

	call CalcPay				; calculating pay

	call WriteDec

	exit
	

main ENDP


CalcPay PROC
	mov eax, hours				; store hours worked
	push eax					; save it for later
	mov ebx, 0					; reset ebx
	mov ecx, 3					; set the times three for ecx
	cmp hours, 40				; compare hours to 40
	jbe NORMAL					; if the hours is <= 40, its normal jump
	

	sub eax, 40					; get the hours without 40
	mul rate					; multiply rate by hours
	mul ecx						; multiply by 3 for triple over time
	mov ebx, eax				; save the value to add onto the result

	mov edx, OFFSET str3		; write overtime prompt
	call WriteString			


	NORMAL:						; no overtime
	pop eax						; restore original hours
	mul rate					; multiply by rate

	add eax, ebx				; add the potential overtime bonus onto original
	
	add row, 1					; move cursor down
	call locate					
	mov edx, OFFSET str4		; load string
	call WriteString			; print total pay is

	ret
CalcPay ENDP

; locate the cursor
Locate PROC
	mov  dh,row
	mov  dl,col
	call Gotoxy
	ret
Locate ENDP

END main