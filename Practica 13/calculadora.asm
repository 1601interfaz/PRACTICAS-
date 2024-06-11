; Calculadora ( Resta )
; Compila con : nasm -f elf calculator - subtraction.asm
; Enlaza con : ld -m elf_i386 calculator - subtraction.o -o calculator -subtraction
; Ejecuta con : ./ calculator - subtraction
%include 'functions.asm'

SECTION .text
global _start

_start :
mov eax , 90 ; mover nuestro primer n m e r o a eax
mov ebx , 9 ; mover nuestro segundo n m e r o a ebx
sub eax , ebx ; restar ebx de eax
call iprintLF ; llama a nuestra i m p r e s i n de n m e r o s enteros con la f u n c i n de avance de l n e a
call quit
