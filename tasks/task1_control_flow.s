section .data
    prompt db "Enter a number: ", 0      ; Prompt message
    positive_msg db "POSITIVE", 0       ; Message for positive number
    negative_msg db "NEGATIVE", 0       ; Message for negative number
    zero_msg db "ZERO", 0               ; Message for zero

section .bss
    number resb 4                       ; Space to store user input

section .text
    global _start

_start:
    ; Print the prompt message
    mov rax, 1                          ; System call for write
    mov rdi, 1                          ; File descriptor for stdout
    mov rsi, prompt                     ; Address of prompt message
    mov rdx, 15                         ; Length of prompt message
    syscall

    ; Read user input
    mov rax, 0                          ; System call for read
    mov rdi, 0                          ; File descriptor for stdin
    mov rsi, number                     ; Address to store user input
    mov rdx, 4                          ; Number of bytes to read
    syscall

    ; Convert ASCII to integer
    mov rbx, number                     ; Load user input
    sub byte [rbx], '0'                 ; Convert ASCII to integer
    mov al, [rbx]                       ; Move the integer value to AL

    ; Classify the number
    cmp al, 0                           ; Compare number with 0
    je .is_zero                         ; Jump if equal to zero
    jl .is_negative                     ; Jump if less than zero
    jmp .is_positive                    ; Default: positive

.is_positive:
    ; Print "POSITIVE"
    mov rax, 1                          ; System call for write
    mov rdi, 1                          ; File descriptor for stdout
    mov rsi, positive_msg               ; Address of positive_msg
    mov rdx, 8                          ; Length of message
    syscall
    jmp .exit                           ; Exit program

.is_negative:
    ; Print "NEGATIVE"
    mov rax, 1                          ; System call for write
    mov rdi, 1                          ; File descriptor for stdout
    mov rsi, negative_msg               ; Address of negative_msg
    mov rdx, 8                          ; Length of message
    syscall
    jmp .exit                           ; Exit program

.is_zero:
    ; Print "ZERO"
    mov rax, 1                          ; System call for write
    mov rdi, 1                          ; File descriptor for stdout
    mov rsi, zero_msg                   ; Address of zero_msg
    mov rdx, 4                          ; Length of message
    syscall

.exit:
    ; Exit the program
    mov rax, 60                         ; System call for exit
    xor rdi, rdi                        ; Exit code 0
    syscall
