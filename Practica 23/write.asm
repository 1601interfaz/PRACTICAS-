; Write
; Compilar con: nasm -f elf write.asm
; Enlaza con: ld -m elf_i386 write.o -o write
; Ejecuta con: ./write

%include 'functions.asm'

SECTION .data
filename db 'readme.txt', 0h ; el nombre del archivo a crear
contents db 'Hola mundo!', 0h ; los contenidos a escribir

SECTION .text
global _start

_start:
    mov ecx, 0777o   ; El código continúa desde la práctica 22
    mov ebx, filename
    mov eax, 8
    int 80h

    mov edx, 12       ; Número de bytes para escribir: uno para cada letra de nuestra cadena de contenido.
    mov ecx, contents ; mueve la dirección de memoria de nuestra cadena de contenido a ecx
    mov ebx, eax      ; mueve el descriptor de archivo del archivo que creamos a ebx
    mov eax, 4        ; invocar SYS_WRITE (código de operación del kernel 4)
    int 80h           ; llamar al kernel

    call quit         ; llama a nuestra función de salida
