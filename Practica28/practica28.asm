; Unlink
; Compilar con : nasm -f elf unlink.asm
; Enlazar con : ld -m elf_i386 unlink.o -o unlink
; Ejecutar con : ./unlink

%include 'functions.asm'

SECTION .data
filename db 'readme.txt', 0 ; el nombre del archivo a eliminar

SECTION .text
global _start

_start:

    mov ebx, filename ; nombre de archivo que eliminaremos
    mov eax, 10 ; invocar SYS_UNLINK (código de operación del kernel 10)
    int 80h ; llamar al kernel

    call quit ; llama a nuestra función de salida

quit:
    mov eax, 1 ; syscall número para exit
    xor ebx, ebx ; código de salida
    int 80h ; llamada al kernel