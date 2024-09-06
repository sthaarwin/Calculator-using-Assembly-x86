global banner
global show_options 
global clear_screen
global breakline
global ask_user

section .data

    ;clear screen variable
    esc_clear_screen db 27, '[2J', 0  ; ESC[2J is the ANSI escape code to clear the screen
    esc_clear_screen_len equ $ - esc_clear_screen

    ; banner variables

    newline db  10, 0


    firstline db ' _____________________________________________', 0
    firstline_len equ $ - firstline


    secondline db '|                                             |', 0
    secondline_len equ $ - secondline
    
    thirdline db '|         Calculator using Assembly           |', 0
    thirdline_len equ $ - thirdline

    fourthline db '|_____________________________________________|', 0
    fourthline_len equ $ - fourthline

    option1 db "1. Addition", 0
    option1_len equ $ - option1

    option2 db "2. Subtraction", 0
    option2_len equ $ - option2

    option3 db "3. Multiplication", 0
    option3_len equ $ - option3

    option4 db "4. Division", 0
    option4_len equ $ - option4
    
    option5 db "5. Exit", 0
    option5_len equ $ - option5

    ask db "Enter your choice : ", 0
    ask_len equ $ - ask

    
    
   

section .text
banner:
    
    ;first line 
    mov eax, 4
    mov ebx, 1
    mov ecx, firstline
    mov edx, firstline_len
    int 0x80
    
    call breakline

    ;second line
    mov eax, 4
    mov ebx, 1
    mov ecx, secondline
    mov edx, secondline_len
    int 0x80

    call breakline

    ;third line
    mov eax, 4
    mov ebx, 1
    mov ecx, thirdline
    mov edx, thirdline_len
    int 0x80

    call breakline

    ;fourth line
    mov eax, 4
    mov ebx, 1
    mov ecx, fourthline
    mov edx, fourthline_len
    int 0x80

    call breakline


    ret

breakline:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret

show_options:
    ;option 1
    mov eax, 4
    mov ebx, 1
    mov ecx, option1
    mov edx, option1_len
    int 0x80

    call breakline

    ;option 2
    mov eax, 4
    mov ebx, 1
    mov ecx, option2
    mov edx, option2_len
    int 0x80

    call breakline

    ;option 3
    mov eax, 4
    mov ebx, 1
    mov ecx, option3
    mov edx, option3_len
    int 0x80

    call breakline

    ;option 4
    mov eax, 4
    mov ebx, 1
    mov ecx, option4
    mov edx, option4_len
    int 0x80

    call breakline

    ;option 5
    mov eax, 4
    mov ebx, 1
    mov ecx, option5
    mov edx, option5_len
    int 0x80

    call breakline

    ret

ask_user:
    mov eax, 4
    mov ebx, 1
    mov ecx, ask
    mov edx, ask_len
    int 0x80
    
    
clear_screen:
    mov eax, 4
    mov ebx, 1
    mov ecx, ''
    mov edx, 1
    int 0x80
    ret