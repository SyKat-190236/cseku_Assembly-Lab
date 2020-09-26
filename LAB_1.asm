.MODEL SMALL
.STACK 100H

.DATA
    
    A DB ?
    B DB ?
    SUM DB ?

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV A,AL
    
    MOV DL," "
    MOV AH,2
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV B,AL
    
    MOV DL," "
    MOV AH,2
    INT 21H
    
    MOV AL,A
    ADD AL,B
    MOV SUM,AL
    
    
    ADD AL,48
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    MOV AX,4C00H
    INT 21H
   
MAIN ENDP

END MAIN