%include "../utils/printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array
    
    xor ecx, ecx
    xor eax, eax
    
    for_body:
    cmp ecx,  ARRAY_LEN
    je final
    
    mov eax, dword [input + 4 * ecx]
    push eax
    inc ecx
    jmp for_body

    final:
    
    xor ecx, ecx
    xor eax, eax
    
    for_body2:
    cmp ecx,  ARRAY_LEN
    je final2
    
    pop eax
    mov dword [output + 4 * ecx], eax
    inc ecx
    jmp for_body2

    final2:

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
