%include "../io.mac"

section .data
    myString: db "Hello, World!", 0
    myString2: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print                        ; TODO1: eax > ebx?
    ret

print:
    PRINTF32 `%s\n\x0`, myString
    sub ecx, 1
    jg print
    
    cmp ecx, 0
    je print2
                                    ; TODO2.2: afisati "Hello, World!" de N ori
                                    ; TODO2.1: afisati "Goodbye, World!"

    ret
    
print2:
    PRINTF32 `%s\n\x0`, myString2 
    ret
