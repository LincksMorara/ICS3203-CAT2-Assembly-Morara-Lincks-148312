# ICS3203-CAT2-Assembly-Morara-Lincks-148312

# ICS3203-CAT2-Assembly-Morara-Lincks-148312

```markdown
# Assembly Programming Tasks

## Task 1: Control Flow and Conditional Logic

### Purpose
This program prompts the user for a number and classifies it as **POSITIVE**, **NEGATIVE**, or **ZERO**. It demonstrates the use of conditional and unconditional jumps for decision-making.

### Key Features
- Implements branching logic using `cmp` and jump instructions (`je`, `jl`, `jmp`).
- Uses system calls for input and output operations.

### Compilation & Execution
```bash
nasm -f elf32 task1.asm -o task1.o
ld -m elf_i386 task1.o -o task1
./task1
```

### Challenges
- Handling **ASCII to integer conversion**.
- Efficiently managing **conditional jumps** to avoid unnecessary branching.

---

## Task 2: Array Manipulation with Looping and Reversal

### Purpose
This program reverses an array of integers in place without using additional memory. It demonstrates **loop structures** and **direct memory manipulation**.

### Key Features
- Uses pointers to iterate through the array and swap values.
- Demonstrates **efficient in-place reversal** without auxiliary storage.

### Compilation & Execution
```bash
nasm -f elf32 task2.asm -o task2.o
ld -m elf_i386 task2.o -o task2
./task2
```

### Challenges
- Ensuring **pointer arithmetic** remains within array bounds.
- Debugging issues related to **memory overwriting during swapping**.

---

## Task 3: Modular Program with Subroutines

### Purpose
This program computes the factorial of a given number using a subroutine. It highlights the importance of **modular code design** and **stack usage** for preserving register states.

### Key Features
- Utilizes the stack to save and restore registers during subroutine calls.
- Implements **recursive function-like behavior** in assembly.

### Compilation & Execution
```bash
nasm -f elf32 task3.asm -o task3.o
ld -m elf_i386 task3.o -o task3
./task3
```

### Challenges
- Managing recursion in assembly and ensuring the **stack is correctly maintained**.
- Understanding how the **stack operates** during subroutine calls.

---

## Task 4: Data Monitoring and Control Simulation

### Purpose
This program simulates a control system where a **sensor value** determines the status of a motor and an alarm. It showcases **basic hardware-level simulation** using memory locations.

### Key Features
- Simulates sensor input using **predefined memory locations**.
- Performs actions like **turning on/off a motor** and **triggering an alarm** based on thresholds.

### Compilation & Execution
```bash
nasm -f elf32 task4.asm -o task4.o
ld -m elf_i386 task4.o -o task4
./task4
```

### Challenges
- Simulating **hardware behavior** in a software environment.
- Accurately mapping **memory locations** to represent hardware components.

---

## General Notes
- All programs are written in **x86 assembly** using **NASM syntax**.
- **System calls** (`int 0x80`) are used for input, output, and program termination.
- Inline comments are included for step-by-step understanding.

---

## Insights and Challenges
1. **Control Flow Logic**: Managing jumps effectively required a clear understanding of program flow to avoid redundant instructions.
2. **Array Manipulation**: Ensuring pointer safety during in-place reversal was crucial, especially when dealing with direct memory access.
3. **Subroutines**: Proper stack usage was critical to avoid corruption of register values during recursive calls.
4. **Hardware Simulation**: Simulating ports and memory manipulation provided insights into low-level hardware interactions.
```
