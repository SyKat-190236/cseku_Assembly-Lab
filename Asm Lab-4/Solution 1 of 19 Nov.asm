.model small
.stack 100h

.data
    sb db ?
    re db ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov al,2
    
    as:
      mov sb,al
      mov ah,0
      mov bh,10
      div bh
      mov re,ah
      
      mov dl,al
      add dl,48
      mov ah,2
      int 21h
      
      mov dl,re
      add dl,48
      mov ah,2
      int 21h
      
      mov dl," "
      mov ah,2
      int 21h
      
      mov al,sb
      add al,2
      mov sb,al
      cmp al,15
      jng as
    
    mov ax,4c00h
    int 21h
main endp

;code submitted by sykat
;student id 190236