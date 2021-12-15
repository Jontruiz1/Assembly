INCLUDE Irvine32.inc

	COMMENT !
		Write the code necessary to store a text field such as
		"This is a random text field". You may hardcode
		the value; input is not necessary. Print the characters of
		the text field in sequential order, one line at a time 

		Additional rules: 
		Code should work for any length of the text field, do not
		hard code any lengths
		
		Use whatever looping instructions you find appropriate and
		any registers that you find appropriate
	!
.data

	str1 BYTE "This is a random text field"

.code
main PROC

	mov ecx, lengthof str1
	mov esi, OFFSET str1
	L1:
		mov eax, [esi];
		call Crlf
		call WriteChar
		inc esi
	loop L1

	exit

main ENDP

END main