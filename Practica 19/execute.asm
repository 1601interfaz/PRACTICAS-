; Execute
; Compilar con : nasm -f elf execute.asm
; Enlazar con : ld -m elf_i386 execute.o -o execute
; Ejecutar con : ./ execute

%include        'functions.asm'

SECTION .data
command         db      '/bin/echo', 0     ;comando para ejecutar
arg1            db      'Hola Mundo !', 0
arguments       dd      command
                dd      arg1                    ;argumentos para pasar a la línea de comando (en este caso solo uno )
                dd      0                     ;terminar la estructura
environment     dd      0                     ;Los argumentos para pasar como variables de entorno (en este caso , ninguno ) finalizan la estructura.

SECTION .text
global _start

_start :

    mov     edx , environment       ;direccion de variables de entorno
    mov     ecx , arguments         ;direccion de los argumentos para pasar a la línea de comando
    mov     ebx , command           ;direccion del archivo a ejecutar
    mov     eax , 11                ;invocar SYS_EXECVE (codigo de operacion del kernel 11)
    int     80h

    call    quit                    ;llama a nuestra funci ón de salida