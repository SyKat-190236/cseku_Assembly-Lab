.model small
.stack 100h

.data
     x dw ?
     sum dw 0
     re db ?
     re2 db ?
.code
    main proc
    mov ax,@data
    mov ds,ax    
        
    mov ah,1
    int 21h
    sub al,48
    
    mov ah,0
    mov x,ax
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h 
    
    xor cx,cx
    mov ah,0
    
    mov cx,1
    mov bx,9
    
    sykatb:
        mov ax,cx
        mul bx
        add ax,sum
        mov sum,ax
        inc cx
        cmp cx,x
        jle sykatb
           
    mov ax,sum
    mov bh,10
    div bh
    mov re,ah
    
    mov ah,0
    div bh
    mov re2,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,re2
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,re
    add dl,48
    mov ah,2
    int 21h           
        
    
    mov ax,4c00h
    int 21h   
    main endp
    
 ;Sykat Biswas ID-190236