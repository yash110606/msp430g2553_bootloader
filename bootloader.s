.section .resetvec,"ax",@progbits
.word _start

.section .text
.global _start

_start:
    mov #0x0280,R1
    mov #0x5A80,&0x0120
    mov.b #0x41,&0x0022
    bic.b #0x41,&0x0021
    bis.b #0x01,&0x0021
    mov #exit,R8
    mov #main,R7
    mov #0x08,R6
    mov #0x0200,R9

l1:
    mov.b @R7,R10
    mov.b R10,@R9
    inc R9
    inc R7
    dec R6
    jnz l1
    mov #0x0200,R0

main:
    bis.b #0x01,&0x0021
    mov R8,R0

exit:
    bis.b #0x40,&0x0021
    jmp exit
    
