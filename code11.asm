;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    prompt db 'Enter a number (0-9): $'
    predefined db 5         
    greater_msg db ' is greater than $'
    less_msg db ' is less than $'
    equal_msg db ' is equal to $'
    newline db 0Dh, 0Ah, '$'
    input_num db ?       
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, prompt
    int 21h
    
   
    mov ah, 01h
    int 21h
    sub al, '0'          
    mov input_num, al   
    

    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov dl, input_num
    add dl, '0'         
    mov ah, 02h
    int 21h
   
    mov al, input_num
    cmp al, predefined
    
  
    jg greater_than
    jl less_than
    
   
    mov ah, 09h
    lea dx, equal_msg
    int 21h
    jmp display_number
    
greater_than:
    mov ah, 09h
    lea dx, greater_msg
    int 21h
    jmp display_number
    
less_than:
    mov ah, 09h
    lea dx, less_msg
    int 21h
    
display_number:
 
    mov dl, predefined
    add dl, '0'        
    mov ah, 02h
    int 21h
    
  
    mov ah, 09h
    lea dx, newline
    int 21h
    
   
    mov ah, 4Ch
    int 21h
main endp
end main