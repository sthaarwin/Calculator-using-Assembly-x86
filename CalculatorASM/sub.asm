
section .data
    ask db 'Enter a number: ', 0
    asklen equ $ - ask

    display db 'The difference is: ', 0
    displaylen equ $ - display

    format db '%d', 0


section .bss    
    num resb 10
    a resd 1
    b resd 1
    result resb 12

section .text
    extern banner
    extern clear_screen
    extern begin
    extern atoi
    extern sprintf
    extern breakline
    global subtraction


subtraction:
    call clear_screen
    call banner

   
     mov eax, 4
    mov ebx, 1
    mov ecx, ask
    mov edx, asklen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    mov byte[num + eax - 1], 0 
    push num
    call atoi
    add esp, 4

    mov [a], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, ask
    mov edx, asklen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    mov byte[num + eax - 1 ], 0
    push num
    call atoi
    add esp, 4

    mov [b],eax
    
    mov eax, [a]
    mov ebx, [b]
    sub eax, ebx

    mov ecx, result
    push eax
    push format
    push ecx
    call sprintf
    add esp, 12


    mov ebx, 1
    mov eax, 4
    mov ecx, display
    mov edx, displaylen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 12
    int 0x80
    call breakline
    ret