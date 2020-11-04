%include "../io.mac"

section .text
    global main
    extern printf

main:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 5
    ; TODO: aflati minimul
    cmp eax, ebx
    jl jump
    xchg eax, ebx
    jump:
    PRINTF32 `%d\n\x0`, eax ; afiseaza minimul

    ret
