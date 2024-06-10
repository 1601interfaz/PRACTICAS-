; Programa Hola Mundo (Cuenta hasta 10 itoa)
; Compilar con: nasm -f elf helloworld-itoa.asm
; Enlace con: ld -m elf_i386 helloworld-itoa.o -o helloworld-itoa
; Ejecutar con: ./helloworld-itoa

%include 'functions_11.asm'

SECTION .text
global _start

_start:

mov ecx, 0

nextNumber:
inc ecx
mov eax, ecx
call iprintLF ; NOTA: Llama a nuestra nueva función de impresión de números enteros (itoa)
cmp ecx, 10
jne nextNumber

call quit
