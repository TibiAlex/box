%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX

    mov ecx ,0
    start:
    cmp ecx, 32
    jg fin
    test eax, ebx
    jnz putere
    
    ret:
    
    shl ebx, 1
    inc ecx
    jmp start

    fin:
   
    leave
    ret
    
putere:
    PRINTF32 `%u\n\x0`, ebx ;
    jmp ret
