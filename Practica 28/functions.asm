; ------------------------------------------
; int slen ( String message )
; Funci ón de calculo de longitud de cadena
slen :
push ebx
mov ebx , eax

nextchar :
cmp byte [eax ] , 0
jz .finished
inc eax
jmp nextchar

.finished :
sub eax , ebx
pop ebx
ret
