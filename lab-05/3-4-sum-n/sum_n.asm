%include "../utils/printf32.asm"

section .data
    num dd 100
    print_format1 db "Sum(", 0
    print_format2 db "): ", 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, [num]     ; Use ecx as counter for computing the sum.
    xor eax, eax       ; Use eax to store the sum. Start from 0.

add_to_sum:

    mov ebx, ecx
    
    start:
    cmp ebx, 0
    je fin
    add eax, ecx 
    add ebx, -1
    jmp start 
    fin:
    loop add_to_sum    ; Decrement ecx. If not zero, add it to sum.

    mov ecx, [num]
    PRINTF32 `%s\x0`, print_format1
    PRINTF32 `%u\x0`, ecx
    PRINTF32 `%s\x0`, print_format2
    PRINTF32 `%u\n\x0`, eax

    leave
    ret
   
