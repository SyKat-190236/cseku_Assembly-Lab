.model small
.stack 100h

.data
    val db ?
    cv db ?
    sb db ?
    msg1 db "Yeah! baby$"
    msg2 db "DUMB baby$"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    mov val,al
    
    mov dl," "
    mov ah,2
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,val
    mov sb,al
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    cmp sb,4
    je block
    
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    block:
         lea dx,msg1
         mov ah,9
         int 21h
    exit:
    
    mov ax,4c00h
    int 21h
main endp

;code submitted by sykat
;student id 190236