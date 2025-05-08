;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    input db '6H$'      
    msg db 'ASCII values: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 09h
    int 21h
    
    lea si, input   
    
display:
    mov al, [si]    
    cmp al, '$'     
    je done
    
    mov bl, al      
    mov cl, 4       
    shr al, cl    
    call print_hex_digit
    
    mov al, bl     
    and al, 0Fh    
    call print_hex_digit
    
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    inc si         
    jmp display
    
done:
    mov ah, 4Ch    
    int 21h
main endp
print_hex_digit proc
    cmp al, 10
    jl digit
    add al, 7     
digit:
    add al, '0'   
    mov dl, al
    mov ah, 02h
    int 21h
    ret
print_hex_digit endp
end main