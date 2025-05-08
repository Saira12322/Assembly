;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    num1 db -5       
    num2 db 3        
    less_msg db 'First number is less than second (signed comparison).$'
    greater_msg db 'First number is greater than second (signed comparison).$'
    equal_msg db 'Numbers are equal.$'
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov al, num1
    cmp al, num2     
    je numbers_equal
    jl first_less
    jg first_greater
    jmp exit_program
    
first_less:

    mov ah, 09h
    lea dx, less_msg
    int 21h
    jmp exit_program
    
first_greater:
   
    mov ah, 09h
    lea dx, greater_msg
    int 21h
    jmp exit_program
    
numbers_equal:
    mov ah, 09h
    lea dx, equal_msg
    int 21h
    
exit_program:
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp
end main
