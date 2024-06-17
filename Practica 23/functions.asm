 ; ------------------------------------------
 ; int slen ( String message )
 ; Funci ón de calculo de longitud de cadena
 slen :
 push ebx
 mov ebx , eax

 ; ------------------------------------------
; void quit ()
; Función para salir del programa
quit:
    mov eax, 1       ; syscall exit
    xor ebx, ebx     ; código de retorno 0
    int 80h          ; llamar al kernel para salir

 nextchar :
 cmp byte [ eax ], 0
 jz .finished
 inc eax
 jmp nextchar

 .finished :
 sub eax , ebx
 pop ebx
 ret