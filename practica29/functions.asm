
.finished :
cmp ecx , 0 ; compare el valor del registro ecx con el decimal 0 ( nuestro registro contador )
je .restore ; saltar si es igual a 0 (no se pasaron argumentos enteros a atoi )
mov ebx , 10 ; mover el valor decimal 10 a ebx
div ebx ; dividir eax por el valor en ebx (en este caso 10)

.restore :
pop esi ; restaurar esi a partir del valor que colocamos en la pila al principio
pop edx ; restaurar edx a partir del valor que colocamos en la pila al principio
pop ecx ; restaurar ecx a partir del valor que colocamos en la pila al principio
pop ebx ; restaurar ebx a partir del valor que colocamos en la pila al principio
ret



; --------------------------------------------------------------------------------
; ------------------------------------------
; void iprint ( Integer number )
; F u n c i n de i m p r e s i n de n m e r o s enteros ( itoa )
iprint :
push eax ; conserva eax en la pila para restaurarlo d e s p u s de que se ejecute la f u n c i n
push ecx ; conserva ecx en la pila para restaurarlo d e s p u s de que se ejecute la f u n c i n
push edx ; conserva edx en la pila para restaurarlo d e s p u s de que se ejecute la f u n c i n
push esi ; conserva esi en la pila para restaurarlo d e s p u s de que se ejecute la f u n c i n
mov ecx , 0 ; contador de c u n t o s bytes necesitamos imprimir al final

divideLoop :
inc ecx ; cuente cada byte para imprimir - n m e r o de caracteres
mov edx , 0 ; limpia edx
mov esi , 10 ; pone 10 en esi
idiv esi ; divide eax por esi
add edx , 48 ; convierta edx a su r e p r e s e n t a c i n ascii : edx retiene el resto d e s p u s de una i n s t r u c c i n de d i v i s i n
push edx ; empujar edx ( r e p r e s e n t a c i n de cadena de un n m e r o entero ) en la pila
cmp eax , 0 ; ?`Se puede seguir dividiendo el n m e r o entero?
jnz divideLoop ; saltar si no es cero a la etiqueta divideLoop

printLoop :
dec ecx ; contar cada byte que ponemos en la pila
mov eax , esp ; mueva el puntero de la pila a eax para imprimir

call sprint ; llama a nuestra f u n c i n de i m p r e s i n de cadenas
pop eax ; elimina el ltimo c a r c t e r de la pila para avanzar especialmente
cmp ecx , 0 ; ?`Hemos impreso todos los bytes que colocamos en la pila?
jnz printLoop ; el salto no es cero a la etiqueta printLoop

pop esi ; restaurar esi a partir del valor que colocamos en la pila al principio
pop edx ; restaurar edx a partir del valor que colocamos en la pila al principio
pop ecx ; restaurar ecx desde el valor que insertamos en la pila al principio
pop eax ; restaurar eax desde el valor que insertamos en la pila al principio
ret

; ------------------------------------------
; void iprintLF ( Integer number )
; F u n c i n de i m p r e s i n de n m e r o s enteros con avance de l n e a ( itoa )
iprintLF :
call iprint ; llame a nuestra f u n c i n de i m p r e s i n de n m e r o s enteros
push eax ; pone eax en la pila para conservarlo mientras usamos el registro eax en esta f u n c i n
mov eax , 0Ah ; mueve 0Ah a eax - 0Ah es el c a r c t e r ascii para un salto de l n e a
push eax ; Pone el salto de l n e a a la pila para que podamos obtener la d i r e c c i n .
mov eax , esp ; mover la d i r e c c i n del puntero de la pila actual a eax para sprint
call sprint ; llama a nuestra f u n c i n de sprint
pop eax ; eliminar nuestro c a r c t e r de salto de l n e a de la pila
pop eax ; restaurar el valor original de eax antes de que se llamara nuestra f u n c i n
ret

; ------------------------------------------
; void sprint ( String message )
; F u n c i n de i m p r e s i n de cadenas
sprint :
push edx
push ecx
push ebx
push eax
call slen

mov edx , eax
pop eax

mov ecx , eax
mov ebx , 1
mov eax , 4
int 80h

pop ebx
pop ecx
pop edx
ret


; ------------------------------------------
; void sprintLF ( String message )
; I m p r e s i n de cadenas con f u n c i n de avance de l n e a
sprintLF :
call sprint

push eax
mov eax , 0AH
push eax
mov eax , esp
call sprint
pop eax
pop eax
ret

; ------------------------------------------
; void exit ()
; Salir del programa y restaurar recursos
quit :
mov ebx , 0
mov eax , 1
int 80h
ret
