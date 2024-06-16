; Espacio de nombres
; Compilar con : nasm -f elf namespace.asm
; Enlazar con : ld -m elf_i386 namespace.o -o namespace
; Ejecuta con : ./ namespace

%include        'functions.asm'
SECTION .data
msg1        db          'Saltar a la etiqueta finished. ', 0 h ; una cadena de mensaje
msg2        db          'Número de subrutina interior : ', 0 h ; una cadena de mensaje
msg3        db          'Dentro de la subrutina " finished ".', 0 h ; una cadena de mensaje
SECTION .text
global _start
_start :
subrountineOne :
    mov     eax , msg1 ; mover la direcci ón de msg1 a eax
    call    sprintLF ; llame a nuestra impresi ón de cadenas con funci ón de avance de linea
    jmp     .finished ; saltar a la etiqueta local bajo el alcance de la subrutinaOne


.finished :
    mov     eax , msg2 ; mover la direcci ón de msg2 a eax
    call    sprint ; llame a nuestra funci ón de impresi ón de cadenas
    mov     eax , 1 ; mueva el valor uno a eax ( para la subrutina numero uno )
    call    iprintLF ; llame a nuestra funci ón de impresi ón de números enteros con la funci ón de avance de linea

subrountineTwo :
    mov     eax , msg1 ; mover la direcci ón de msg1 a eax
    call    sprintLF ; llame a nuestra cadena print con funci ón de avance de linea
    jmp     .finished ; saltar a la etiqueta local bajo la subrutinaDos alcance

.finished :
    mov     eax , msg2 ; mover la direcci ón de msg2 a eax
    call    sprint ; llame a nuestra funci ón de impresi ón de cadenas
    mov     eax , 2 ; mueva el valor dos a eax ( para la subrutina numero dos )
    call    iprintLF ; llame a nuestra funci ón de impresi ón de números enteros con la funci ón de avance de linea
    mov     eax , msg1 ; mover la direcci ón de msg1 a eax
    call    sprintLF ; llame a nuestra impresi ón de cadenas con funci ón de avance de linea
    jmp     finished ; saltar a la etiqueta global terminado

finished :
    mov     eax , msg3 ; mover la direcci ón de msg3 a eax
    call    sprintLF ; Llame a nuestra impresi ón de cadenas confunci ón de avance de linea.
    call    quit ; llama a nuestra funci ón de salida