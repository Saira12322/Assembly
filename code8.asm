;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    msg1 db 'This message will be printed.$'
    msg2 db 'This message will be skipped.$'
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    

    mov ah, 09h
    lea dx, msg1
    int 21h
    
 
    lea dx, newline
    int 21h
    
 
    jmp skip_msg2
    

    mov ah, 09h
    lea dx, msg2
    int 21h
    

    lea dx, newline
    int 21h
    
skip_msg2:
   
    mov ah, 09h
    lea dx, msg1
    int 21h
    

    mov ah, 4Ch
    int 21h
main endp
end main