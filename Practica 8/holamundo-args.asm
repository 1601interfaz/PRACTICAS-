 ;Programa Hola Mundo ( Imprimir con avance de l n e a )
 ; Compilar con : nasm -f elf helloworld - lf.asm
 ; Enlace con : ld -m elf_i386 helloworld - lf.o -o helloworld -lf
 ; Ejecuta con : ./ helloworld -lf

 %include     'functions.asm'

 SECTION .data
 msg1 db 'Hola , feliz mundo nuevo !', 0 h ; NOTA : hemos eliminado el c a r c t e r de avance de l n e a 0Ah.
 msg2 db ' A s es como reciclamos en NASM. ', 0 h ; NOTA : hemos eliminado el c a r c t e r de avance de l n e a 0Ah.

 SECTION .text
 global _start

 _start :

 mov  eax , msg1
 call sprintLF ; NOTA : Estamos llamando a nuestra nueva i m p r e s i n con f u n c i n de avance de l n e a .
 mov eax , msg2
 call sprintLF ; NOTA : Estamos llamando a nuestra nueva i m p r e s i n con f u n c i n de avance de l n e a .
 call quit
 