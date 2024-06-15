; Read
 ; Compilar con : nasm -f elf read.asm
 ; Enlaza con : ld -m elf_i386 read.o -o read
 ; Ejecutare con : ./ read

 %include 'functions.asm'

 SECTION .data 
 filename db 'readme.txt', 0h ; el nombre del archivo a crear
 contents db 'Hello world!', 0h ; los contenidos a escribir

 SECTION .bss 
 fileContents resb 255, ; variable para almacenar el contenido del archivo

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

 mov edx , 12 ; Número de bytes a leer : uno por cada letra del contenido del archivo.
 mov ecx , fileContents ; mover la direcci ón de memoria de la variable de contenido de nuestro archivo a ecx
 mov ebx , eax ; mover el descriptor del archivo abierto a EBX
 mov eax , 3 ; invocar SYS_READ (có digo de operaci ón del kernel 3)
 int 80h ; llamar al kernel

 mov eax , fileContents ; mover la dirección de memoria de la variable de contenido de nuestro archivo a eax para imprimir
 call sprintLF ; llama a nuestra función de impresi ón de cadenas

 call quit ; llama a nuestra función de salida 
 