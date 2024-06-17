; ------------------------------------------
; void iprint ( Integer number )
; Función de impresión de números enteros (itoa)
iprint:
push eax ; conserva eax en la pila para restaurarlo después de que se ejecute la función
push ecx ; conserva ecx en la pila para restaurarlo después de que se ejecute la función
push edx ; conserva edx en la pila para restaurarlo después de que se ejecute la función
push esi ; conserva esi en la pila para restaurarlo después de que se ejecute la función
mov ecx, 0 ; contador de cuántos bytes necesitamos imprimir al final

divideLoop:
inc ecx ; cuente cada byte para imprimir - número de caracteres
mov edx, 0 ; limpia edx
mov esi, 10 ; pone 10 en esi
idiv esi ; divide eax por esi
add edx, 48 ; convierta edx a su representación ascii: edx retiene el resto después de una instrucción de división
push edx ; empujar edx (representación de cadena de un número entero) en la pila
cmp eax, 0 ; ¿Se puede seguir dividiendo el número entero?
jnz divideLoop ; saltar si no es cero a la etiqueta divideLoop

printLoop:
dec ecx ; contar cada byte que ponemos en la pila
mov eax, esp ; mueva el puntero de la pila a eax para imprimir

call sprint ; llama a nuestra función de impresión de cadenas
pop eax ; elimina el último carácter de la pila para avanzar especialmente
cmp ecx, 0 ; ¿Hemos impreso todos los bytes que colocamos en la pila?
jnz printLoop ; el salto no es cero a la etiqueta printLoop

pop esi ; restaurar esi a partir del valor que colocamos en la pila al principio
pop edx ; restaurar edx a partir del valor que colocamos en la pila al principio
pop ecx ; restaurar ecx desde el valor que insertamos en la pila al principio
pop eax ; restaurar eax desde el valor que insertamos en la pila al principio
ret

; ------------------------------------------
; void iprintLF ( Integer number )
; Función de impresión de números enteros con avance de línea (itoa)
iprintLF:
call iprint ; llame a nuestra función de impresión de números enteros

push eax ; pone eax en la pila para conservarlo mientras usamos el registro eax en esta función
mov eax, 0Ah ; mueve 0Ah a eax - 0Ah es el carácter ascii para un salto de línea
push eax ; Pone el salto de línea a la pila para que podamos obtener la dirección
mov eax, esp ; mover la dirección del puntero de la pila actual a eax para sprint
call sprint ; llama a nuestra función de sprint
pop eax ; eliminar nuestro carácter de salto de línea de la pila
pop eax ; restaurar el valor original de eax antes de que se llamara nuestra función
ret

; ------------------------------------------
; int slen ( String message )
; Función de cálculo de longitud de cadena
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

; ------------------------------------------
; void sprint ( String message )
; Función de impresión de cadenas
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
int 0x80

pop ebx
pop ecx
pop edx
ret

; ------------------------------------------
; void sprintLF ( String message )
; Impresión de cadenas con función de avance de línea
sprintLF:
call sprint

push eax
mov eax, 0Ah
push eax
mov eax, esp
call sprint
pop eax
pop eax
ret

; ------------------------------------------
; void exit ()
; Salir del programa y restaurar recursos
quit:
mov ebx, 0
mov eax, 1
int 0x80
ret
