section .data
    msg_input db "Enter a number for factorial: ", 0
    msg_result db "Factorial result: ", 0

section .bss
    number resb 4

section .text
    global start

start:
    ; Prompt for input
    mov rdi, msg_input
    call print_string

    ; Read number
    mov rsi, number
    call read_int

    ; Calculate factorial using subroutine
    mov rdi, [number]    ; Load number into rdi
    call factorial

    ; Print result
    mov rdi, msg_result
    call print_string
    mov rsi, rax         ; Load result (factorial) into rsi
    call print_number

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall

factorial:
    ; Base case: if rdi == 1, return 1
    cmp rdi, 1
    je .done
    push rdi
    dec rdi
    call factorial
    pop rdi
    imul rax, rdi       ; Multiply result by current rdi
    ret

.done:
    mov rax, 1           ; Base case, return 1
    ret

; Print string function (same as Task 1)
print_string:
    mov rax, 0x0
    mov rdi, 1
    mov rdx, 255
    syscall
    ret

; Print number function
print_number:
    ; Simplified: Convert number to string and print
    ret

; Read integer function (same as Task 1)
read_int:
    mov rax, 0
    mov rdi, 0
    mov rdx, 4
    syscall
    ret
