%include "../utils/printf32.asm"

%define ARRAY_SIZE 13
%define DECIMAL_PLACES 5

section .data

    num_array dw 76, 12, 65, 19, 781, 671, 431, 761, 782, 12, 91, 25, 9
    decimal_point db ".",0
    num dw 0
       
section .text

extern printf
global main
main:
    xor eax, eax
    mov ecx, ARRAY_SIZE
    xor edx, edx

    ; TODO1 - compute the sum of the vector numbers - store it in eax
    
add_word_array_element:
    mov dx, word [num_array + 2 * (ecx -1)]
    add eax, edx
    loop add_word_array_element

    PRINTF32 `Sum of numbers: %u\n\x0`, eax

    ; TODO2 - compute the quotient of the mean
    
    
    xor ebx, ebx
    xor edx, edx
    
    mov bx, ARRAY_SIZE
    div bx

    xor ebx, ebx
    mov bx, ax

    PRINTF32 `Mean of numbers: %d \x0`, eax
    
     ; TODO3 - compute the current decimal place - store it in ax
    
    mov ebx, ARRAY_SIZE
    mov eax, edx
    mov ecx, DECIMAL_PLACES
    
    for_zecimale:
    cmp ecx, 0
    je final_zecimale
    
    mov dword[num], eax
    cmp eax, ARRAY_SIZE
    jl mai_mic
    
    mai_mare:
    xor edx, edx    
    
    cmp eax, ebx
    jg divide
    
    post_divide:

    PRINTF32 `%d\x0`, edx
    
    dec ecx
    jmp for_zecimale  
    final_zecimale:
    
    PRINTF32 `\n\x0`
    xor eax, eax
    ret
    
mai_mic:
    mov edx, 1
    multiplication:
    cmp edx, 10
    je final_multiplication
    add eax, dword[num]
    inc edx
    jmp multiplication
    final_multiplication:
    
    jmp mai_mare
   
divide: 
    sub eax, ebx
    inc edx
    cmp eax, ebx
    jg divide
    
    jmp post_divide
    
    
    
    
    
    
    
    
    
    
    
    
    
    
