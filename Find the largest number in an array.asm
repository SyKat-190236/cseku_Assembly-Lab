.model small
.stack 100h
.data
    a db 5 dup(?)
    max db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov al,1
    
    xor cx,cx
    mov bx,0
    
    mov cx,5
    mov ah,1
    for:
       int 21h
       mov a[bx],al
       inc bx
    loop for
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    xor cx,cx
    mov cx,5
    mov bx,0
    mov al,a[bx]
    mov max,al
    for2: 
       cmp a[bx],al
       jge update
       rsm:
        inc bx
        loop for2
    prnt:
     mov dl,al
     mov ah,2
     int 21h
     jmp exit
    
    update:
        mov al,a[bx]
        jmp rsm
    exit:
    mov ax,4c00h
    int 21h
    main endp
end main