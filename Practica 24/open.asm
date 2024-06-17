; open.asm

%include 'functions.asm'

section .data
    filename db 'readme.txt', 0
    contents db 'Hola Mundo!', 0

section .text
    global _start

    _start:
        ; Crear archivo
        mov ecx, 0777o   ; Modo de acceso
        mov ebx, filename
        mov eax, 8       ; SYS_CREAT
        int 80h

        ; Escribir en el archivo
        mov edx, 12      ; Longitud de los contenidos
        mov ecx, contents
        mov ebx, eax     ; El descriptor de archivo devuelto por SYS_CREAT
        mov eax, 4       ; SYS_WRITE
        int 80h

        ; Abrir archivo para lectura
        mov ecx, 0       ; Modo de acceso O_RDONLY
        mov ebx, filename
        mov eax, 5       ; SYS_OPEN
        int 80h

        ; Llamar a funciones necesarias
        call iprintLF   ; Llamar a nuestra función de imprimir números enteros

        ; Salir del programa
        call quit       ; Llamar a nuestra función de salida

