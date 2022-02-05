INCLUDE Irvine32.inc

.data
    row byte ?
    col byte ?
.code
main PROC
    mov eax, 0                              ; just zeroing out eax and edx
    mov edx, 0
    mov bl, '1'                             ; load the character 1 into bl

    call Randomize                          ; seeding the values
    mov ecx, 10000                           ; loop count
    L1:
       
        call RandColor
        mov eax, 0
        mov edx, 0
        call GetMaxXY                       ; puts row in al col in dl
        push edx
        call RandPos
       




        mov al, bl                          ; load the num into al to write it 
        call WriteChar                      ; write the char

        mov [esi + edi], al                 ; load the num we just printed into the console array

        mov eax, 10             
        call Delay
    loop L1

    exit
main ENDP

;  Finds random position and goes to it
RandPos PROC
    call RandomRange        ; random num in range 0 -> row-1, puts it into eax
    mov dh, al

    mov eax, col
    call RandomRange        ; random num in range 0 -> col-1, puts it into eax
    mov dl, al

    add dh, 1
    add dl, 1

    call Gotoxy                ; call the Gotoxy to move the cursor over

    ret
RandPos ENDP

;  Sets the random color for the character
RandColor PROC

    mov eax, 16                         ; 16 for 16 colors
    call RandomRange                    ; random range in from 0 to 15
    cmp eax, 0                          ; if random num generated is 0, add 1
    jne nblack
    add eax, 1
    nblack: call SetTextColor           ; else just set text color to eax
    ret

RandColor ENDP


END main