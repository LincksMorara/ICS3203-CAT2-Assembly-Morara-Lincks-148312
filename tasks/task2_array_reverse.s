section .data
    msg_input db "Enter 5 numbers separated by space: ", 0
    msg_result db "Reversed array: ", 0

section .bss
    arr resb 20          ; 5 integers, each 4 bytes

section .text
    global _start

_start:
    ; Prompt for input
    mov rdi, msg_input
    call print_string

    ; Read 5 integers from user input
    mov rsi, arr
    call read_array

    ; Reverse the array in place
    mov rbx, arr         ; Point rbx to the start of the array
    add rbx, 16          ; Move to the last element of the array
    mov rcx, 5           ; Loop counter (5 elements)

reverse_loop:
    cmp rsi, rbx         ; Compare front pointer with back pointer
    jge done_reversing    ; If front >= back, we are done

    ; Swap elements
    mov rdx, [rsi]       ; Load front element into rdx
    mov r8, [rbx]        ; Load back element into r8
    mov [rbx], rdx       ; Store front element at back
    mov [rsi], r8        ; Store back element at front

    ; Move pointers
    add rsi, 4           ; Increment front pointer
    sub rbx, 4           ; Decrement back pointer
    loop reverse_loop

done_reversing:
    ; Print the reversed array
    mov rdi, msg_result
    call print_string
    mov rsi, arr
    call print_array

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall

; Print string function (same as Task 1)
print_string:
    mov rax, 0x0
    mov rdi, 1
    mov rdx, 255
    syscall
    ret

; Read array of integers (simplified)
read_array:
    mov rax, 0
    mov rdi, 0
    mov rdx, 20          ; Read 20 bytes (5 integers)
    syscall
    ret

; Print array (simplified for 5 integers)
print_array:
    mov rax, 0x0
    mov rdi, 1
    mov rdx, 20
    syscall
    ret
