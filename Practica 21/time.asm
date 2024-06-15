; Time
; Compilar con: nasm -f elf time.asm
; Enlace con: ld -m elf_i386 time.o -o time
; Ejecuta con: ./time

%include 'functions.asm'

SECTION .data
msg db 'Segundos desde Ene 01 1970: ', 0h ; una cadena de mensaje

SECTION .text
global _start

_start:

    mov eax, msg            ; Mueva nuestra cadena de mensaje a eax para imprimir
    call sprint             ; Llame a nuestra función de impresión de cadenas

    mov eax, 13             ; Invocar SYS_TIME (código de operación del kernel 13)
    int 0x80                ; Llamar al kernel

    call iprintLF           ; Llame a nuestra función de impresión de números enteros con salto de línea
    call quit               ; Llame a nuestra función de salida
