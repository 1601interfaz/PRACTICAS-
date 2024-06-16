; Fork
; Compilar con : nasm -f elf fork.asm
; Enlazar con : ld -m elf_i386 fork.o -o fork
; Ejecuta con : ./ fork

%include        'functions.asm'
SECTION .data
childMsg        db      'Este es el proceso hijo', 0h         ;una cadena de mensaje
parentMsg       db      'Este es el proceso principal', 0h    ;una cadena de mensaje
SECTION .text
global _start
_start :
    mov     eax , 2             ;invocar SYS_FORK (có digo de operaci ón del kernel 2)
    int     80h
    cmp     eax , 0             ;si eax es cero estamos en el proceso hijo
    jz      child               ;saltar si eax es cero a la etiqueta secundaria

parent :
    mov     eax , parentMsg     ; dentro de nuestro proceso principal , mueve parentMsg a eax 
    call    sprintLF            ; llame a nuestra impresi ón de cadenas con funci ón de avance de línea
    call    quit                ; salir del proceso padre

child :
    mov eax , childMsg          ; dentro de nuestro proceso hijo , mueva childMsg a eax
    call sprintLF               ; llame a nuestra impresi ón de cadenas con funci ón de avance de línea
    call quit                   ; salir del proceso hijo