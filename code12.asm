;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    num1 db 0FFh     
    num2 db 01h      
    carry_msg db 'Addition produced a carry!$'
    no_carry_msg db 'No carry occurred.$'
    sum_msg db 'Sum: $'
    newline db 0Dh, 0Ah, '$'
    result db ?   
.code
main proc
    mov ax, @data
    mov ds, ax
    
  
    mov al, num1
    add al, num2      
    mov result, al
    
  
    mov ah, 09h
    lea dx, sum_msg
    int 21h
    
 
    mov dl, result
    call print_byte  
    
  
    mov ah, 09h
    lea dx, newline
    int 21h
    

    jc carry_occurred
    
    mov ah, 09h
    lea dx, no_carry_msg
    int 21h
    jmp exit_program
    
carry_occurred:

    mov ah, 09h
    lea dx, carry_msg
    int 21h
    
exit_program:
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp

print_byte proc
    push ax
    push cx
    
    mov al, dl
    mov cl, 4
    shr al, cl     
    call print_hex_digit
    
    mov al, dl
    and al, 0Fh      
    call print_hex_digit
    
    pop cx
    pop ax
    ret
print_byte endp

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