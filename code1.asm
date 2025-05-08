;Saira farooq
;23-SE-093

.model small
.stack 100h
.data 
input db 'a'
output db '?','$'
.code
main proc
    mov ax,@data 
    mov ds,ax
    mov al,input
    sub al,20h
    mov output ,al
    mov dl,output
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h
    end main