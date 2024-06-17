 ; Close
 ; Compilar con : nasm -f elf close.asm
 ; Enlazar con : ld -m elf_i386 close.o -o close
 ; Ejecuta con :./ close

 %include 'functions.asm'

 SECTION .data
 filename db 'readme.txt ', 0h ; el nombre del archivo a crear contents db 'Hola Mundo !', 0h ; los contenidos a escribir
 contents db 'Hola Mundo !', 0h ; los contenidos a escribir

 SECTION .bss
 fileContents resb 255 , ; variable para almacenar el contenido del archivo

 SECTION .text
 global _start

 _start :

 mov ecx , 0777o ; Crear archivo de la práctica 22
 mov ebx , filename
 mov eax , 8
 int 80h

 mov edx , 12 ; Escribir contenidos al archivo de la práctica 23
 mov ecx , contents
 mov ebx , eax
 mov eax , 4
 int 80h

 mov ecx , 0 ; Abrir archivo de la práctica 24
 mov ebx , filename
 mov eax , 5
 int 80h

 mov edx , 12 ; Leer el archivo de la práctica 25
 mov ecx , fileContents
 mov ebx , eax
 mov eax , 3
 int 80 

 mov eax , fileContents
 call sprintLF

 mov ebx , ebx ; no es necesario pero se usa para demostrar que SYS_CLOSE toma un descriptor de archivo de EBX
 mov eax , 6 ; invocar SYS_CLOSE (có digo de operación del kernel 6)
 int 80h ; llamar al kernel

 call quit ; llama a nuestra función de salida
