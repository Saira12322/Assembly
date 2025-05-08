;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    str db '19H$'      
    msg db 'ASCII values: $'
    newline db 0Dh, 0Ah, '$' 
.code
main proc
    mov ax, @data
    mov ds, ax
    
 
    lea dx, msg
    mov ah, 09h
    int 21h
    
    lea si, str     
    
display:
    mov al, [si]    
    cmp al, '$'     
    je done
    

    mov bl, al      
    mov ah, 0     
    mov al, bl    
    mov cl, 100    
    div cl       
    mov ch, ah     
    
    
    cmp al, 0
    je no_hundreds
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    
no_hundreds:
   
    mov al, ch     
    mov ah, 0
    mov cl, 10
    div cl       
    
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    

    mov al, ah
    add al, '0'
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