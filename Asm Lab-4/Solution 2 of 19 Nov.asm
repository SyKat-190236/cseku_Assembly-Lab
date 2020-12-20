.model small
.stack 100h

.data
     a db ?
     b db ?
     c db ?
     sum db ?
     sb1 db ?
     g db ?
     l db ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov dl," "
    mov ah,2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov dl," "
    mov ah,2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov c,al
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    mov al,a
    mov bl,b
    mov bh,c
    
    cmp al,bl
    je sykat
    jmp nok
    sykat:
        cmp bl,bh
        je ok
        jmp nok
        ok:
            add al,bl
            add al,bh
            mov sum,al
            mov ah,0
            mov bh,10
            div bh
            mov sb1,ah
            
            mov dl,al
            add dl,48
            mov ah,2
            int 21h
            
            mov dl,sb1
            add dl,48
            mov ah,2
            int 21h
            jmp exit
    nok:
    mov al,a
    mov bl,b
    mov bh,c
    
    mov g,al
    cmp bl,al
    jg ha
    jmp na
    ha:
       mov g,bl
       cmp bh,bl
       jg ha2
       jmp ng
      ha2:
       mov g,bh
       jmp ng
    na:
     cmp bh,al
     jg ha2
     jmp ng
     
    ng:
        mov al,a
        mov bl,b
        mov bh,c
        
        mov l,al
        cmp bl,al
        jl ka
        jmp pa
        ka:
           mov l,bl
           cmp bh,bl
           jl ka2
           jmp e
          ka2:
           mov l,bh
           jmp exit
        pa:
         cmp bh,al
         jl ka2
         jmp e  
    e:
    mov al,g
    mov bl,l
    sub al,bl
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h 
                
    exit:
    mov ax,4c00h
    int 21h
main endp

;code submitted by sykat
;student id 190236