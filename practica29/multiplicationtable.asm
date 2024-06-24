%include 'functions.asm'

section .data
    prompt_msg db 'Ingrese un numero del 1 al 10: ', 0
    result_msg db 'Tabla de multiplicar de: ', 0
    error_msg db 'Error: Ingrese un numero del 1 al 10', 0
    newline db 0x0A, 0x0D, 0   ; Salto de línea y retorno de carro
    times_str db ' x ', 0
    eq_str db ' = ', 0

section .bss
    user_input resb 2          ; Buffer para almacenar el número introducido por el usuario

section .text
    global _start

_start:
    ; Mostrar prompt para que el usuario ingrese un número
    mov eax, prompt_msg
    call sprint

    ; Leer número desde consola
    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, 2
    int 0x80  ; syscall para leer desde consola

    ; Convertir número de ASCII a entero
    mov eax, user_input
    call atoi
    mov ebx, eax

    ; Verificar que el número esté en el rango 1-10
    cmp ebx, 1
    jl error_input
    cmp ebx, 10
    jg error_input

    ; Mostrar mensaje de título para la tabla de multiplicar
    mov eax, result_msg
    call sprint
    ; Mostrar el número introducido
    mov eax, ebx
    call iprintLF

    ; Inicializar contador
    mov ecx, 1

print_table:
    ; Mostrar el contador
    mov eax, ecx
    call iprint

    ; Mostrar ' x '
    mov eax, times_str
    call sprint

    ; Mostrar número ingresado
    mov eax, ebx
    call iprint

    ; Mostrar ' = '
    mov eax, eq_str
    call sprint

    ; Calcular multiplicación
    mov eax, ecx
    imul eax, ebx

    ; Convertir resultado a cadena y mostrarlo
    call iprintLF

    ; Incrementar contador
    inc ecx

    ; Si el contador es menor o igual a 10, continuar imprimiendo
    cmp ecx, 10
    jle print_table

end_program:
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

error_input:
    ; Mostrar mensaje de error
    mov eax, error_msg
    call sprintLF

    ; Salir del programa con error
    mov eax, 1
    mov ebx, 1
    int 0x80
