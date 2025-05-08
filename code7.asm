;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    prompt1 db 'Enter first number (0-9): $'
    prompt2 db 'Enter second number (0-9): $'
    prompt3 db 'Enter third number (0-9): $'
    same_msg db 'Numbers are not different. Exiting...$'
    result_msg db 'Largest number is: $'
    newline db 0Dh, 0Ah, '$'
    
    num1 db ?
    num2 db ?
    num3 db ?
    largest db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
  
    lea dx, prompt1
    mov ah, 09h
    int 21h
    call read_digit
    mov num1, al
    
 
    lea dx, newline
    mov ah, 09h
    int 21h
    lea dx, prompt2
    mov ah, 09h
    int 21h
    call read_digit
    mov num2, al
    

    cmp al, num1
    je not_different
    
 
    lea dx, newline
    mov ah, 09h
    int 21h
    lea dx, prompt3
    mov ah, 09h
    int 21h
    call read_digit
    mov num3, al
    

    cmp al, num1
    je not_different
    cmp al, num2
    je not_different
    
 
    mov al, num1
    mov largest, al
    
    mov al, num2
    cmp al, largest
    jle check_third
    mov largest, al
    
check_third:
    mov al, num3
    cmp al, largest
    jle display_result
    mov largest, al
    
display_result:
    lea dx, newline
    mov ah, 09h
    int 21h
    lea dx, result_msg
    mov ah, 09h
    int 21h
    mov dl, largest
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp exit
    
not_different:
    lea dx, newline
    mov ah, 09h
    int 21h
    lea dx, same_msg
    mov ah, 09h
    int 21h
    
exit:
    mov ah, 4Ch  
    int 21h
main endp

read_digit proc
    mov ah, 01h
    int 21h
    sub al, '0'
    ret
read_digit endp
end main