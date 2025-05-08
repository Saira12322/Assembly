;Saira Farooq
;23-SE-093

.model small
.stack 100h
.data
    carry_set_msg    db 'Carry flag was SET (CF=1)$'
    carry_clear_msg  db 'Carry flag was CLEAR (CF=0)$'
    stc_msg          db 'Executing STC (Set Carry Flag)...$'
    clc_msg          db 'Executing CLC (Clear Carry Flag)...$'
    newline          db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    lea dx, stc_msg
    int 21h
    
    stc           
    jc carry_is_set1
    mov ah, 09h
    lea dx, carry_clear_msg
    int 21h
    jmp demo2
    
carry_is_set1:
    mov ah, 09h
    lea dx, carry_set_msg
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    
demo2:
    mov ah, 09h
    lea dx, clc_msg
    int 21h
    
    clc             
    jnc carry_is_clear
    mov ah, 09h
    lea dx, carry_set_msg
    int 21h
    jmp exit_program
    
carry_is_clear:
    mov ah, 09h
    lea dx, carry_clear_msg
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    
exit_program:
    mov ah, 4Ch
    int 21h
main endp
end main
