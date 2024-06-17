; functions.asm

section .data
    ; Aquí puedes definir datos si es necesario para tus funciones

section .text
    global iprintLF
    global quit

    ; Función para imprimir un número entero seguido de un salto de línea
    ; Suponiendo que iprintLF imprimirá un número entero
    iprintLF:
        ; Código para imprimir el número entero y luego un salto de línea
        ; Ejemplo de código para imprimir un número entero:
        ; mov eax, [esp + 4]  ; Suponiendo que el argumento está en la pila
        ; call print_integer  ; Función para imprimir un número entero
        ; call print_newline  ; Función para imprimir un salto de línea
        ret

    ; Función para salir del programa
    quit:
        mov eax, 1       ; syscall exit
        xor ebx, ebx     ; código de retorno 0
        int 80h          ; llamar al kernel para salir
