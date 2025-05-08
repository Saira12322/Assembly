;Saira farooq
;23-SE-093

.model small
.stack 100h
.data 
input db 'HITEC','$'
output db '$'
.code
main proc
    mov ax,@data 
    mov ds,ax 
    
    mov si,0
convert:
     mov al,[input+si]
     cmp al,'$'
     je done
     cmp al,'A'
     
     jl next_char 
     
     cmp al,'Z'
     jg next_char
     
     add al,20h
     mov [output+si],al
next_char:
        inc si
        jmp convert
done:
   mov dx ,offset output
   mov ah,09h
   int 21h
end main
main endp
    