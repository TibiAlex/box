%include "../utils/printf32.asm"

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abCDefghij", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    push mystring
    pop eax
    xor ebx, ebx
    for_body:
    cmp ebx, 10
    je final
    
    mov dl, [eax + ebx]
    cmp dl, 97
    jl ending
    cmp dl, 122
    jg ending
    
    sub dl, 32
    mov [eax + ebx], dl
    
    ending:
    inc ebx
    jmp for_body
    final:
    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
