; Fizzbuzz
; Compilar con : nasm -f elf fizzbuzz.asm
; Enlazar con : ld -m elf_i386 fizzbuzz.o -o fizzbuzz
; Ejecuta con : ./ fizzbuzz
section .data
    fizz db "Fizz", 10, 0
    buzz db "Buzz", 10, 0
    fizzbuzz db "FizzBuzz", 10, 0
    newline db 10, 0

section .bss
    num resb 12

section .text
    global _start

_start:
    mov ecx, 1       ; Counter, starting from 1

.loop:
    cmp ecx, 101     ; Stop after printing 100
    jge .exit        ; Exit if ecx >= 101

    ; Check for FizzBuzz
    mov eax, ecx
    mov ebx, 15
    xor edx, edx
    div ebx          ; edx = ecx % 15
    cmp edx, 0
    je .print_fizzbuzz

    ; Check for Fizz
    mov eax, ecx
    mov ebx, 3
    xor edx, edx
    div ebx          ; edx = ecx % 3
    cmp edx, 0
    je .print_fizz

    ; Check for Buzz
    mov eax, ecx
    mov ebx, 5
    xor edx, edx
    div ebx          ; edx = ecx % 5
    cmp edx, 0
    je .print_buzz

    ; Print number
    call print_number
    jmp .next

.print_fizz:
    mov eax, fizz
    call print_string
    jmp .next

.print_buzz:
    mov eax, buzz
    call print_string
    jmp .next

.print_fizzbuzz:
    mov eax, fizzbuzz
    call print_string
    jmp .next

.next:
    inc ecx
    jmp .loop

.exit:
    mov eax, 1       ; sys_exit
    xor ebx, ebx
    int 0x80

print_number:
    pusha
    mov eax, ecx
    mov edi, num + 11
    mov byte [edi], 0
print_number_loop:
    xor edx, edx
    div dword [ten]
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz print_number_loop
    mov eax, edi
    call print_string
    popa
    ret

print_string:
    pusha
    mov edx, 0       ; Calculate string length
print_string_len:
    cmp byte [eax + edx], 0
    je print_string_write
    inc edx
    jmp print_string_len
print_string_write:
    mov ebx, 1       ; File descriptor (stdout)
    mov ecx, eax     ; Pointer to string
    mov eax, 4       ; sys_write
    int 0x80
    mov eax, newline
    mov edx, 1
    int 0x80
    popa
    ret

section .data
ten dd 10