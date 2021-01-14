.model small
.stack 100h
.data
    a db 5 dup(?)
    b db 5 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax

    
    ;3 input array
    mov bx,0
    for:
    mov ah,1
    int 21h
    sub al,48
    mov b[bx],al
    
    ;space
    mov dl," "
    mov ah,2
    int 21h
    inc bx
    
    cmp bx,3 ;change here for adding less than 5 size array 
    jl for
    
    ;new line
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    
    ;5 input array
    mov bx,0
    for2:
    mov ah,1
    int 21h
    sub al,48
    mov a[bx],al
    
    ;space
    mov dl," "
    mov ah,2
    int 21h
    inc bx
    
    cmp bx,5
    jl for2
    
    ;adding loop
    mov bx,0
    for3:
    mov al,a[bx]
    add al,b[bx]
    mov a[bx],al
    inc bx
    cmp bx,5
    jl for3
    
    ;new line
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    
    ;output loop
    mov bx,0
    for4:
    mov dl,a[bx]
    add dl,48
    mov ah,2
    int 21h
    
    ;space
    mov dl," "
    int 21h
    
    inc bx
    cmp bx,5
    jl for4 
    
    mov ax,4c00h
    int 21h
    main endp
end main
;code submitted by 190236