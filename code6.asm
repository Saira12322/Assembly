;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    digits db '0','9','3','$'
     
    msg db 'Digits in Hex: $'
    
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
  
    lea dx, msg
    mov ah, 09h
    int 21h
    
    lea si, digits 
    
display:
    mov al, [si]     
    cmp al, '$' 
    je done
    
    mov dl, al
    mov ah, 02h
    int 21h
   
    lea dx, newline
    mov ah, 09h
    int 21h
    
    inc si           
    jmp display
    
done:
    mov ah, 4Ch   
    int 21h
main endp
end main