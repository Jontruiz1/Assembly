INCLUDE Irvine32.inc
	COMMENT !
		Given the following data definition,
		write the code necessary to display all
		the even numbers between 0 and TestINT.
		Note that the value of TestINT is not 
		defined so the code should work for any
		value of TestInt
	!
.data
TestINT DWORD 0
.code
main PROC
	shr TestINT, 1
	mov ecx, TestINT
	mov eax, 0
	call writeint

	cmp ecx, 1
	jbe STOP

	L1:
		add eax, 2
		call writeint
		

	loop L1

	STOP: 
	exit

main ENDP
END main