.model small
.stack 100h
.data
    a db 1,2,3,4,5
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;making all number negative
    mov bx,0
    for:
    neg a[bx]
    inc bx
    cmp bx,5
    jl for
    
    ;output loop
    mov bx,0
    for2:
    ;negative sign print
    mov dl,"-"
    mov ah,2
    int 21h
    
    ;printing the positive value
    mov dl,a[bx]
    neg dl
    add dl,48
    mov ah,2
    int 21h
    
    ;printing space
    mov dl," "
    int 21h
    
    inc bx
    cmp bx,5
    jl for2
    
    mov ax,4c00h
    int 21h
    main endp
end main
;code submitted by 190236