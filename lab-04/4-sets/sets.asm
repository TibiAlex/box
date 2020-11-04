%include "../io.mac"

section .data
    myString: db "Too big!", 0

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    or eax, ebx
    PRINTF32 `Reuniunea este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;

    ; TODO2: adaugarea unui element in multime
    mov ecx, 4
    cmp ecx, 255
    jg negativ
    or eax, ecx
    PRINTF32 `Multimea dupa ce am adaugat un elem este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;

    ; TODO3: intersectia a doua multimi
    mov eax, 139
    mov ebx, 169
    and eax, ebx
    PRINTF32 `Intersectia este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;

    ; TODO4: complementul unei multimi
    mov eax, 139
    not al
    PRINTF32 `Complementul multimii este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;

    ; TODO5: eliminarea unui element
    mov eax, 139
    mov ecx, 128
    xor eax, ecx
    PRINTF32 `Multimea fara un element este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;

    ; TODO6: diferenta de multimi EAX-EBX
    mov eax, 139
    mov ebx, 169
    or eax, ebx
    sub eax, ebx
    PRINTF32 `Diferenta multimilor este: \x0`;
    PRINTF32 `%u\n\x0`, eax ;
    

    xor eax, eax
    ret
    
negativ:
    PRINTF32 `%s\n\x0`, myString
    ret
