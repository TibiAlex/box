%include "../utils/printf32.asm"

section .data
    mystring db "ana", 0, "are", 0, "mere", 0
    len dd 13

section .text

extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, mystring
    mov eax, dword[len]
    push eax
    push ecx
    call rot13	
     
    leave
    ret
    
rot13:
    pop eax ;;????
    pop ecx
    pop eax
    mov dword[len], eax
    xor eax, eax
    xor edx, edx
    xor ebx, ebx
    
    for_body:
    cmp eax, dword[len]
    je final
    
    mov dl, [ecx + eax]
    cmp dl, 0
    je spatiu_gol
    cmp dl, 'm'
    jg prea_mare
    add dl, 13
    back1:
    back:
    PRINTF32 `%c\x0`, edx
    inc eax
    jmp for_body
    final:
    leave
    ret
    
spatiu_gol:
    dec eax
    mov dl, [ecx + eax]
    cmp dl, 0
    je final
    inc eax
    inc dword[len]
    mov dl, " "
    jmp back
    
prea_mare:
    sub dl, 13
    jmp back1
    
    
