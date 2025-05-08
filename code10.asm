;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    number db 7       
    even_msg db 'The number is even.$'
    odd_msg db 'The number is odd.$'
    newline db 0Dh, 0Ah, '$' 
.code
main proc
    mov ax, @data
    mov ds, ax
    
 
    mov al, number
    test al, 1      
    
  
    jz even_label
    

    mov ah, 09h
    lea dx, odd_msg
    int 21h
    jmp exit_program
    
even_label:
 
    mov ah, 09h
    lea dx, even_msg
    int 21h
    
exit_program:

    mov ah, 09h
    lea dx, newline
    int 21h
   
    mov ah, 4Ch
    int 21h
main endp
end main