; Calculadora (ATOI)
; Compilar con: nasm -f elf calculator-atoi.asm
; Enlazar con: ld -m elf_i386 calculator-atoi.o -o calculator-atoi
; Ejecutar con: ./calculator-atoi 20 1000 317

%include 'functions.asm'

SECTION .text
global _start

_start:
    pop ecx              ; El primer valor en la pila es el numero de argumentos.
    pop edx              ; El segundo valor en la pila es el nombre del programa (descartado cuando inicializamos edx).
    sub ecx, 1           ; Disminuir ecx en 1 (numero de argumentos sin nombre de programa).
    mov edx, 0           ; Inicializar nuestro registro de datos para almacenar adiciones.

nextArg:
    cmp ecx, 0h          ; Comprobar si nos queda algun argumento.
    jz noMoreArgs        ; Si se establece el indicador cero, salte a la etiqueta noMoreArgs (saltando sobre el final del bucle).
    pop eax              ; Sacar el siguiente argumento de la pila.
    call atoi            ; Convertir nuestra cadena ascii a un entero decimal.
    add edx, eax         ; Realizar nuestra logica de suma.
    dec ecx              ; Disminuir ecx (numero de argumentos restantes) en 1.
    jmp nextArg          ; Saltar a la etiqueta nextArg.

noMoreArgs:
    mov eax, edx         ; Mover el resultado de nuestros datos a eax para imprimir.
    call iprintLF        ; Llamar a nuestra impresion de numeros enteros con funcion de avance de linea.
    call quit            ; Llama a nuestra funcion de salida.
