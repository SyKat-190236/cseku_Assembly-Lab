.model small
.stack 100h

.data
    a dw 500
    b dw 245
    id dw 36
    re dw ?
    re2 dw ?
.code
    main proc
        
        mov ax,@data
        mov ds,ax
        
        ;ax=a
        ;bx=b
        ;ax=ax-bx
        mov ax,a
        mov bx,b
        sub ax,bx
        
        ;printing 3 digit number
        mov bx,10
        div bx
        mov re,dx
        div bx
        mov re2,dx
        mov dl,al
        add dl,48
        mov ah,2
        int 21h
        mov dx,re2
        add dl,48
        int 21h
        mov dx,re
        add dl,48
        int 21h
        
        ;printing new line
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
        
        ;ax=a
        ;bx=b
        ;ax=ax-bx
        mov ax,a
        mov bx,b
        sub ax,bx
        
        ;adding 2 digit of id 
        ;as last two digit of my id is 36 (id=36)
        mov bx,id
        add ax,bx
        
        ;printing 3 digit number
        mov dx,0
        mov bx,10
        div bx
        mov re,dx
        mov dx,0
        div bx
        mov re2,dx
        mov dl,al
        add dl,48
        mov ah,2
        int 21h
        mov dx,re2
        add dl,48
        int 21h
        mov dx,re
        add dl,48
        int 21h
        
        
        mov ax,4c00h
        int 21h
    main endp
end main

;output result
;255
;291
;explanation
;500-245=255
;255+36=291
    