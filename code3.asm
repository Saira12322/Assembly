;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    str db 'HiTec UNIVERSITY$'
.code
main proc
    mov ax, @data
    mov ds, ax
    lea si, str     
    
convert:
    mov al, [si]     
    cmp al, '$'   
    je done
    

    cmp al, 'A'
    jb next       
    cmp al, 'Z'
    ja next        
    
    add al, 32   
    mov [si], al 
    
next:
    inc si           
    jmp convert
    
done:
   
    lea dx, str
    mov ah, 09h
    int 21h
    
    mov ah, 4Ch  
    int 21h
main endp
end main