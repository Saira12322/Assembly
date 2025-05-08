;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    num1 dw 30000    
    num2 dw 20000   
    overflow_msg db 'Multiplication overflow occurred!$'
    no_overflow_msg db 'No overflow occurred.$'
    result_msg db 'Result: $'
    newline db 0Dh, 0Ah, '$'
    result_hi dw ?    
    result_lo dw ?    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, num1
    imul num2       
    
    mov result_hi, dx
    mov result_lo, ax
   
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov ax, result_hi
    call print_word
    
    mov dl, ':'
    mov ah, 02h
    int 21h
   
    mov ax, result_lo
    call print_word
   
    mov ah, 09h
    lea dx, newline
    int 21h
    
 
    jo overflow_occurred
    mov ah, 09h
    lea dx, no_overflow_msg
    int 21h
    jmp exit_program
    
overflow_occurred:
    mov ah, 09h
    lea dx, overflow_msg
    int 21h
exit_program:
    mov ah, 09h
    lea dx, newline
    int 21h
    mov ah, 4Ch
    int 21h
main endp
print_word proc
    push ax
    push bx
    push cx
    
    mov bx, ax        
    mov cx, 4       
    
print_digit:
    rol bx, 4       
    mov al, bl
    and al, 0Fh    
    cmp al, 10
    jl digit
    add al, 7     
digit:
    add al, '0'   
    mov dl, al
    mov ah, 02h
    int 21h
    loop print_digit
    
    pop cx
    pop bx
    pop ax
    ret
print_word endp
end main