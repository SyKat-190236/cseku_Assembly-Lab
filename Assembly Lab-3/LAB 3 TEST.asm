.model small
.stack 100h

.data
     n db ?

.code
    main proc
    mov ax,@data
    mov ds,ax    
        
    mov ah,1
    int 21h
    sub al,48
    mov n,al
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h 
    
    xor cx,cx
    mov ah,0
    
    mov bl,n
    
    
    sykatb:
        mov cl,1
        sb:
            mov dl,cl
            add dl,48
            mov ah,2
            int 21h
            inc cl
            
            cmp cl,n
            jl dash
            
            dash:
                mov dl,"-"
                mov ah,2
                int 21h
            
            cmp cl,n
            jle sb
         
         mov dl,10
         mov ah,2
         int 21h
         mov dl,13
         mov ah,2
         int 21h
         
         dec bl
         cmp bl,0
         jg sykatb   
               
        
    
    mov ax,4c00h
    int 21h   
    main endp
 ;Sykat Biswas ID-190236