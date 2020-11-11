%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
       array dd 1392, -12544, 7992, -6992, 7202, 27187, -28789, 17897, -12988, 17992

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    
    fun:
    cmp ecx, ARRAY_SIZE
    je fin
    mov edx, dword [array + 4*(ecx)]
    
    cmp edx, 0
    jg poz
    
    cmp edx, 0
    jl neg
    
    lls:
    
    inc ecx
    
    jmp fun

    fin:
    
    PRINTF32 `%u\n\x0`, eax ;
    PRINTF32 `%u\n\x0`, ebx ;
    
    xor eax,eax
    xor ebx, ebx
    xor ecx,ecx
    xor edx,edx
    
    funy:
    cmp ecx, ARRAY_SIZE
    je finy
    mov edx, dword [array + 4*(ecx)]
    
    test edx, 1
    jnz impar
    
    test edx, 1
    jz par
    
    llsa:
     
    inc ecx 
    jmp funy

    finy:
    
    PRINTF32 `%u\n\x0`, eax ;
    PRINTF32 `%u\n\x0`, ebx ;
   
    leave
    ret
    
poz : 
    inc eax
    jmp lls
    
neg:
    inc ebx
    jmp lls
    
par:
    inc eax
    jmp llsa
    
impar:
    inc ebx
    jmp llsa
    
