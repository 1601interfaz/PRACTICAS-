; Calculadora (Suma)
; Compilar con: nasm -f elf calculator-addition.asm
; Enlace con: ld -m elf_i386 calculator-addition.o -o calculator-addition
; Ejecutar con: ./calculator-addition

%include 'functions_11.asm'

SECTION .text
global _start

_start:

mov eax, 90   ; Mover nuestro primer número a eax
mov ebx, 9    ; Mover nuestro segundo número a ebx
add eax, ebx  ; Sumar ebx a eax
call iprintLF ; Llamar a nuestra función de impresión de números enteros con salto de línea
call quit     ; Llamar a la función de salida del programa
