; Programa Hola Mundo (Cuenta hasta 10)
; Compilar con: nasm-f elf helloworld-10.asm
; Enlazar con: ld-m elf_i386 helloworld-10.o-o helloworld-10
; Ejecuta con: ./helloworld-10

%include 'functions.asm'

SECTION .text
global _start

 _start:

    mov ecx, 0 ; ecx se inicializa a cero.

 nextNumber:
    inc ecx ; incrementar ecx

    mov eax, ecx ; mover la direccion de nuestro numero entero a eax
    add eax, 48 ; agregue 48 a nuestro n mero para convertir de entero a ascii para imprimir
    push eax ; empujar eax a la pila
    mov eax, esp ; obtener la direcci n del personaje en la pila
    call sprintLF ; llama a nuestra funci n de impresi n

    pop eax ; Limpiar la pila para que no tengamos bytes innecesarios que ocupen espacio.
    cmp ecx, 10 ; Ya llegamos a 10? compara nuestro contador con el decimal 10
    jne nextNumber ; salta si no es igual y sigue contando

    call quit