%include "../utils/printf32.asm"

%define NUM_FIBO 10

section .data
       num dd 0

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    mov ecx, NUM_FIBO
    mov dword[num], ecx
    cmp ecx, 1
    je doar_un_element
    
    cmp ecx, 2
    je doar_doua_elemente
    
    mov eax , 0
    push eax
    mov ebx, 1
    push ebx
    sub ecx, 2
    
    for_body:
    cmp ecx, 0
    je ending
    
    mov edx, ebx
    add ebx, eax
    mov eax, edx
    push ebx
    
    dec ecx
    jmp for_body
    ending:
    mov ecx, dword[num]
    
print:
    
    pop eax
    PRINTF32 `%d \x0`, eax
    dec ecx
    cmp ecx, 0
    ja print
    
    final:

    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret
    
doar_un_element:
    mov eax, 0
    push eax
    pop eax
    PRINTF32 `%d \x0`, eax
    jmp final
    
doar_doua_elemente:
    mov eax, 0
    mov ebx, 1
    push eax
    push ebx
    pop ebx
    pop eax
    PRINTF32 `%d \x0`, eax
    PRINTF32 `%d \x0`, ebx
    jmp final
    
    
    
    
    
    
