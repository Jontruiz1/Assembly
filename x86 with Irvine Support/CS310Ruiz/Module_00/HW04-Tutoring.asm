INCLUDE Irvine32.inc
.data
MaxRows DWORD 10
MaxColumns DWORD 10
table byte 100 dup (?)


.code
main PROC
 mov bl, '1' 
 mov ecx, 200 ; How many times the loop will execute
 mov eax, 0
 mov edx, 0   ;  put 0 in edx since we will be using the dl and dh register

 L1:
 mov eax, 16 
 call RandomRange 
 call SetTextColor
 
 mov eax, MaxRows     ; Moving 80 to eax
 call RandomRange     ; will produce a random number from what was given to eax
 add eax, 1           ; Add 1 to eax so we dont get any 0s in the range
 mov dh, al           ; move the contents in the al register to dh

 mov eax, MaxColumns  ; mov 80 to eax
 call RandomRange     ; will produce a random number from what was given to eax
 add eax, 1           ; Add 1 to eax so we dont get any 0s in the range
 mov dl, al

 call GoToXY

 mov edi, offset table
 mov eax, MaxRows
 mul dh
 add edi, eax
 mov dh, 0
 mov esi, edx
 mov al, [esi + edi]


 .IF al == bl
	inc bl
	.IF bl > '9'
		mov bl, '1'
	.ENDIF
 .ENDIF


 notequal:
 mov al, bl
 call WriteChar
 mov [esi + edi], bl

 mov eax, 100
 call delay

 loop L1
 


exit
main ENDP
END main