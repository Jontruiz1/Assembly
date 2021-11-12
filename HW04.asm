INCLUDE Irvine32.inc

.data
row dword 10
col dword 10

console byte (100) dup(0)                   ; screen buffer based on row * col elements

.code

main PROC
    mov eax, 0                              ; just zeroing out eax and edx
    mov edx, 0

    call Randomize                          ; seeding the values
    
    mov bl, '1'                             ; load the character 1 into bl

    mov ecx, 1000
    L1:
        call RandColor
        call RandPos

        mov edi, offset console             ; get the offset of the console into edi
        mov eax, 10                         ; row size into eax
        mul dh                              ; row size * row index
        add edi, eax                        ; getting the row offset
        mov dh, 0                           ; zeroing out dh so dl is the only thing left
        mov esi, edx                        ; moving column index into esi
        mov al, [esi+edi]                   ; basically doing mov al, [ebx+esi]  
                                            ; which moves the element into al

        cmp al, bl              ; if al == bl
        jne normal              ; not, jump to write the char
        inc bl                  ; else, increment bl
        cmp bl, '9'             ; if bl > '9'
        jbe normal              ; not, jump to write the char
        mov bl, '1'             ; true, reset bl to '1'

        normal:
        mov al, bl              ; load the num into al to write it 
        call WriteChar          ; write the char

        mov [esi + edi], al     ; load the num we just printed into the console array

        mov eax, 10
        call Delay
    loop L1

    exit
main ENDP

;  Finds random position and goes to it
RandPos PROC
    mov eax, row
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