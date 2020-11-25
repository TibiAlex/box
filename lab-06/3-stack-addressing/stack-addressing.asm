%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    xor esi , esi
    mov ecx, NUM
push_nums:
    sub esp, 1
    mov eax, ecx
    add eax, 48
    mov [esp], al
    loop push_nums

    sub esp, 1
    mov ecx, 0
    mov [esp], cl
    mov ecx, "mere"
    sub esp, 4
    mov [esp], ecx
    mov ecx, "are "
    sub esp, 4
    mov [esp], ecx
    mov ecx ,"Ana "
    sub esp, 4
    mov [esp], ecx
    
    
    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    
    xor eax, eax
    for_body:
    cmp esp, ebp
    je final
    
    mov eax, esp
    
    PRINTF32 `0x%x \x0`, eax
    PRINTF32 `%c\n\x0`, byte[eax]
    inc esp
    jmp for_body
    
    final:
    PRINTF32 `%s \x0`, eax
     
    ; TODO 3: print the string
    
    ; TODO 4: print the array on the stack, element by element.
    pop eax
    

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
