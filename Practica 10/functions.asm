;-----------------------------------------
; int slen(String message)
; Funci n de c lculo de longitud de cadena
slen:
    push ebx
    mov ebx, eax

    nextchar:
        cmp byte [eax], 0
        jz finished
        inc eax
        jmp nextchar

    finished:
        sub eax, ebx
        pop ebx
        ret
;-----------------------------------------
; void sprint(String message)
; Funci n de impresi n de cadenas
    sprint:
        push edx
        push ecx
        push ebx
        push eax
        call slen

        mov edx, eax
        pop eax

        mov ecx, eax
        mov ebx, 1
        mov eax, 4
        int 80h

        pop ebx
        pop ecx
        pop edx
        ret
 
 
;-----------------------------------------
; void sprintLF(String message)
; Impresi n de cadenas con funci n de avance de l nea
    sprintLF:
    call sprint

    push eax ; Enviamos eax a la pila para conservarlo mientras usamos el registro eax en esta funci n
    mov eax, 0Ah ; mueve 0Ah a eax: 0Ah es el car cter ascii para un salto de l nea
; como eax tiene 4 bytes de ancho, ahora contiene 0000000Ah
    push eax ; Enviamos el salto de l nea a la pila para que podamos obtener la direcci n.
; dado que tenemos una arquitectura little endian, los bytes del registro eax se almacenan en orden inverso,
; esto corresponde al contenido de la memoria de pila de 0Ah, 0h, 0h, 0h,
; d ndonos un salto de l nea seguido de un byte de terminaci n NULL
    mov eax, esp ; mueve la direcci n del puntero de la pila actual a eax para sprint
    call sprint ; llama a nuestra funci n sprint
    pop eax ; eliminar nuestro car cter de salto de l nea de la pila
    pop eax ; restaurar el valor original de eax antes de que se llamara nuestra funci n
    ret ; volver a nuestro programa


;-----------------------------------------
; void exit()
; Salir del programa y restaurar recursos.
    quit:
        mov ebx, 0
        mov eax, 1
        int 80h
        ret