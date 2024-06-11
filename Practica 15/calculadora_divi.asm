; Calculadora ( D i v i s i n )
; Compilar con : nasm -f elf calculator - division.asm
; Enlazar con : ld -m elf_i386 calculator - division.o -o calculator - division
; Ejecuta con : ./ calculator - division

%include 'functions.asm'

SECTION .data
msg1 db ' resto ' ; Una cadena de mensaje para generar correctamente el resultado

SECTION .text
global _start

_start :

mov eax , 90 ; mover nuestro primer n m e r o a eax
mov ebx , 9 ; mover nuestro segundo n m e r o a ebx
div ebx ; dividir eax por ebx
call iprint ; llame a nuestra f u n c i n de i m p r e s i n den m e r o s enteros en el cociente

mov eax , msg1 ; mover nuestra cadena de mensaje a eax
call sprint ; llama a nuestra f u n c i n de i m p r e s i n de cadenas
mov eax , edx ; mover nuestro resto a eax
call iprintLF ; llame a nuestra i m p r e s i n de n m e r o s enteros con f u n c i n de avance de l n e a

call quit