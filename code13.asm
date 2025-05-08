;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    num1 db 10       
    num2 db 10     
    zero_msg db 'The result is zero!$'
    not_zero_msg db 'The result is not zero.$'
    result_msg db 'Result: $'
    newline db 0Dh, 0Ah, '$'
    difference db ?  
.code
main proc
    mov ax, @data
    mov ds, ax
    
   
    mov al, num1
    sub al, num2   
    mov difference, al 
    
   
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov dl, difference
    add dl, '0'      
    mov ah, 02h
    int 21h
    
 
    mov ah, 09h
    lea dx, newline
    int 21h
    
 
    test al, al      
    jz result_zero
    
  
    mov ah, 09h
    lea dx, not_zero_msg
    int 21h
    jmp exit_program
    
result_zero:
    mov ah, 09h
    lea dx, zero_msg
    int 21h
    
exit_program:
    mov ah, 09h
    lea dx, newline
    int 21h
    mov ah, 4Ch
    int 21h
main endp
end main
