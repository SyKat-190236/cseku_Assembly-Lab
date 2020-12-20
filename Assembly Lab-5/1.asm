.model small
.stack 100h

.data
    n db ?
    on equ 1
    to equ 1
    re db ?
    re2 db ?
.code
    main proc
        
        mov ax,@data
        mov ds,ax
        mov cx,1
        
        ;two times loop is runing
        for:
        ;taking 2digit input
        mov ah,1
        int 21h
        sub al,48
        mov bh,10
        mul bh
        mov bl,al
        mov ah,1
        int 21h
        sub al,48
        add al,bl
        mov n,al
        
        ;print new line
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        int 21h
        
        ;al=first number of fibonacci series
        ;bl=2nd number of f.s.
        ;bh=n
        mov al,on
        mov bl,to
        mov bh,n
        mov dl,n
        
        ;calling fibo function
        ;store result at n
        call fibo
        
        ;printing 3 digit result
        mov al,n
        mov ah,0
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
        int 21h
        mov dl,re
        add dl,48
        int 21h
        
        ;print newline
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        int 21h
        
        inc cx
        cmp cx,2
        jle for
        
        mov ax,4c00h
        int 21h
    main endp
    
    ;fibo function to get fibonacci number
    fibo proc
        ;compairing if first two number is wanted
        cmp dl,2
        jle exit
        sub bh,2
        for2:
        ;al=al+bl
        add al,bl
        mov n,bl
        mov bl,al
        mov al,n
        dec bh
        cmp bh,0
        jg for2
        jmp ber
        exit:
        cmp dl,2
        je ber
        mov bl,al ;assinging al if n=01
        ber:
        mov n,bl  ;finally result is on n
        ret
        fibo endp
        
end main
    
    