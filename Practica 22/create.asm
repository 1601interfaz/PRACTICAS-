; Create
; Compilar con: nasm -f elf create.asm
; Enlace con: ld -m elf_i386 create.o -o create
; Ejecuta con: ./create

%include 'functions.asm'

SECTION .data
    filename db 'readme.txt', 0h    ; el nombre del archivo a crear

SECTION .text
    global _start

_start:
    mov ecx, 0777o                  ; establecer todos los permisos para leer, escribir y ejecutar
    mov ebx, filename               ; nombre de archivo que crearemos
    mov eax, 8                      ; invocar SYS_CREAT (código de operación del kernel 8)
    int 80h                         ; llamar al kernel
    call quit                       ; llama a nuestra función de salida
