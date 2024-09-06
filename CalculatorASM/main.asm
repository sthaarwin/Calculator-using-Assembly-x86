extern banner
extern ask_user
extern show_options
extern clear_screen
extern breakline
extern atoi
extern addition
extern subtraction
extern multiplication
extern division

section .data
    invalid_msg db 'Invalid input', 0
    invalid_msg_len equ $ - invalid_msg

section .bss
    userChoice resb 10
    userChoiceInt resd 1

section .text
    global _start
    global userChoice
    global userChoiceInt

_start:
    call begin
    call exit


user_input:
    mov eax, 3
    mov ebx, 0
    mov ecx, userChoice
    mov edx, 10
    int 0x80

    call convertChoiceToInt
    call check_input

    ret

convertChoiceToInt:

    mov byte[userChoice + eax - 1], 0 
    push userChoice
    call atoi
    add esp, 4

    mov [userChoiceInt], eax

    ret

check_input:

    mov eax, [userChoiceInt]
    cmp eax, 1
    jl invalid
    cmp eax, 5
    jg invalid

    cmp eax, 1
    je addition

    cmp eax, 2
    je subtraction

    cmp eax, 3
    je multiplication

    cmp eax, 4
    je division

    cmp eax, 5
    je exit
    ret

invalid:
    mov eax, 4
    mov ebx, 1
    mov ecx, invalid_msg
    mov edx, invalid_msg_len
    int 0x80

    call breakline
    call ask_user
    ret

begin:
    call banner
    call show_options
    call ask_user
    call user_input
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
    ret
