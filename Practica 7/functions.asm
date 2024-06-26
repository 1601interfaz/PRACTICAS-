; ------------------------------------------
;int slen ( String message )F u n c i n de c l c u l o de longitud de cadena
slen :
push ebx
mov ebx , eax

nextchar :
cmp byte [eax ] , 0
jz finished
inc eax
jmp nextchar

finished :
sub eax , ebx
pop ebx
ret


; ------------------------------------------
;void sprint ( String message )F u n c i n de i m p r e s i n de cadenas
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
;void sprintLF ( String message ) I m p r e s i n de cadenas con f u n c i n de avance de l n e a
sprintLF :
call sprint

push eax
mov eax , 0Ah
push eax

mov eax , esp
call sprint

pop eax
pop eax
ret


; ------------------------------------------
;void exit ()Salir del programa y restaurar recursos.
quit :
mov ebx , 0;
mov eax , 1;
int 80h;
ret;