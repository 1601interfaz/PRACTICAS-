; Calculadora ( M u l t i p l i c a c i n )
; Compilar con : nasm -f elf calculator - multiplication.asm
; Enlazar con : ld -m elf_i386 calculator - multiplication.o -o calculator -multiplication
; Ejecuta con : ./ calculator - multiplication

%include 'functions.asm'
SECTION .text
global _start

_start :
mov eax , 90 ; mover nuestro primer n m e r o a eax
mov ebx , 9 ; mover nuestro segundo n m e r o a ebx
mul ebx ; multiplicar eax por ebx
call iprintLF ; llame a nuestra i m p r e s i n de n m e r o s enteros con la f u n c i n de avance de l n e a

call quit