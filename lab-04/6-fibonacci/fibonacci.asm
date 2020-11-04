%include "../io.mac"

section .text
    global main
    extern printf

main:
    mov eax, 7     ; vrem sa aflam al N-lea numar; N = 7

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    
    cmp eax, 1
    je jump1
    
    cmp eax, 2
    je jump2
    
    cmp eax, 3
    je jump2
    
    mov ebx, 1
    mov ecx, 1
    jump4:
    cmp eax, 3
    jg jump3
    
    PRINTF32 `%u\n\x0`, ebx;

    ret
    
jump1:
    mov ebx, 0
    PRINTF32 `%u\n\x0`, ebx;
    ret
    
jump2:
    mov ebx, 1
    PRINTF32 `%u\n\x0`, ebx;
    ret
    
jump3:
    mov edx, ebx
    add ebx, ecx
    mov ecx, edx
    sub eax, 1
    jmp jump4
