;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    num1 db 5     
    num2 db 5     
    equal_msg db 'The numbers are equal!$'
    not_equal_msg db 'The numbers are not equal.$'
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
   
    mov al, num1
    cmp al, num2    
    

    je equal_label
    
    mov ah, 09h
    lea dx, not_equal_msg
    int 21h
    jmp exit_program
    
equal_label:
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