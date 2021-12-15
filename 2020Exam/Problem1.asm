INCLUDE Irvine32.inc
	COMMENT !
		Write the code necessary to define 
		an array containing some number of double
		words and assign ARRAYLEN equal to the number
		of elements in the array. The code should work for 
		any number of elments in the array
	!
.data
	intarr dword 23, 10, 50, 44
	arraylen dword lengthof intarr
	

.code
main PROC
	exit
main ENDP
END main