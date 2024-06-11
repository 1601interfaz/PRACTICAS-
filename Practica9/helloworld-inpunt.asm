 ; Programa Hola Mundo ( obteniendo i n f o r m a c i n )
 ; Compilar con : nasm -f elf helloworld - input.asm
 ; Enlaza con : ld -m elf_i386 helloworld - input.o -o helloworld - input4 
 ; Ejecutar con : ./ helloworld - input

 %include 'functions.asm'

 SECTION .data
 msg1 db 'Introduce tu nombre : ', 0 h ; cadena de mensaje solicitando i n f o r m a c i n al usuario
 msg2 db 'Hola , ', 0 h ; cadena de mensaje que se u s a r d e s p u s de que el usuario haya ingresado su nombre

 SECTION .bss
 sinput : resb 255 ; reservar un espacio de 255 bytes en la memoria para la cadena de entrada de los usuarios

 SECTION .text
 global _start

 _start :

 mov eax , msg1
 call sprint

 mov edx , 255 ; n m e r o de bytes para leer
 mov ecx , sinput ; espacio reservado para almacenar nuestra entrada ( conocido como buffer )
 mov ebx , 0 ; leer del archivo STDIN
 mov eax , 3 ; invoca SYS_READ ( c d i g o de o p e r a c i n del kernel 3)
 int 80h

 mov eax , msg2
 call sprint

 mov eax , sinput ; mover nuestro buffer a eax ( Nota : la entrada contiene un salto de l n e a )
 call sprint ; llama a nuestra f u n c i n de i m p r e s i n

 call quit
