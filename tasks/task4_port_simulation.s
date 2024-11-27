section .data
    msg_sensor db "Sensor value: ", 0
    msg_motor_on db "Motor ON", 0
    msg_motor_off db "Motor OFF", 0
    msg_alarm db "ALARM: Water level too high!", 0

section .bss
    sensor_value resb 1

section .text
    global _start

_start:
    ; Simulate reading sensor value (hardcoded value)
    mov byte [sensor_value], 2    ; Example sensor value

    ; Print sensor value
    mov rdi, msg_sensor
    call print_string
    mov rsi, sensor_value
    call print_number

    ; Check sensor value and control actions
    mov al, [sensor_value]
    cmp al, 1       ; Check if sensor value is high (>=1)
    jl motor_off
    cmp al, 2       ; Check if sensor value is too high (>=2)
    jge alarm

motor_on:
    mov rdi, msg_motor_on
    call print_string
    jmp _exit

motor_off:
    mov rdi, msg_motor_off
    call print_string
    jmp _exit

alarm:
    mov rdi, msg_alarm
    call print_string

_exit:
    mov rax, 60
    xor rdi, rdi
    syscall

; Print string and other functions same as Task 1
print_string:
    mov rax, 0x0
    mov rdi, 1
    mov rdx, 255
    syscall
    ret

print_number:
    ret
