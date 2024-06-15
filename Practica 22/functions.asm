; functions.asm

SECTION .data
newline db 10, 0    ; carácter de nueva línea para iprintLF

SECTION .text
global slen, sprint, iprintLF, iprint, quit

;-----------------------------------------
; int slen(String message)
; Función de calculo de longitud de cadena
slen:
    push ebx           ; Guarda el valor de ebx en la pila
    mov ebx, eax       ; Copia el puntero de la cadena a ebx

nextchar:
    cmp byte [eax], 0  ; Compara el byte en eax con 0
    jz finished        ; Si es 0, salta a la etiqueta finished
    inc eax            ; Incrementa eax para apuntar al siguiente byte
    jmp nextchar       ; Vuelve al inicio del bucle

finished:
    sub eax, ebx       ; Resta el puntero inicial del puntero final
    pop ebx            ; Restaura el valor original de ebx
    ret                ; Vuelve a la función que llamó

;-----------------------------------------
; void sprint(String message)
; Función de impresión de cadenas
sprint:
    pusha                   ; Guarda todos los registros generales
    mov ecx, eax            ; Copia el puntero de la cadena a ecx
    call slen               ; Llama a slen para obtener la longitud de la cadena
    mov edx, eax            ; Copia la longitud de la cadena a edx
    mov ebx, 1              ; Archivo descriptor (stdout)
    mov eax, 4              ; Número de llamada al sistema (sys_write)
    int 0x80                ; Llama al kernel
    popa                    ; Restaura todos los registros generales
    ret                     ; Vuelve a la función que llamó

;-----------------------------------------
; void iprintLF(int number)
; Función de impresión de número entero con salto de línea
iprintLF:
    pusha                   ; Guarda todos los registros generales
    mov ebx, eax            ; Copia el número a ebx
    call iprint             ; Llama a iprint para imprimir el número
    mov eax, newline        ; Carga el carácter de nueva línea en eax
    call sprint             ; Llama a sprint para imprimir el salto de línea
    popa                    ; Restaura todos los registros generales
    ret                     ; Vuelve a la función que llamó

;-----------------------------------------
; void iprint(int number)
; Función de impresión de número entero
iprint:
    pusha                   ; Guarda todos los registros generales
    mov ecx, 10             ; Divisor para obtener cada dígito
    mov edi, esp            ; Utiliza la pila para almacenar los dígitos temporales
convert:
    xor edx, edx            ; Limpia edx
    div ecx                 ; Divide eax por 10
    add dl, '0'             ; Convierte el dígito en carácter
    dec edi                 ; Decrementa el puntero de pila
    mov [edi], dl           ; Almacena el dígito en la pila
    test eax, eax           ; Prueba si el cociente es 0
    jnz convert             ; Si no es 0, sigue convirtiendo
print_digits:
    mov eax, esp            ; Copia el puntero de pila a eax
    sub eax, edi            ; Calcula la longitud de los dígitos convertidos
    mov ecx, edi            ; Copia el puntero de dígitos a ecx
    mov edx, eax            ; Copia la longitud de los dígitos a edx
    mov ebx, 1              ; Archivo descriptor (stdout)
    mov eax, 4              ; Número de llamada al sistema (sys_write)
    int 0x80                ; Llama al kernel
    popa                    ; Restaura todos los registros generales
    ret                     ; Vuelve a la función que llamó

;-----------------------------------------
; void quit()
; Función de salida del programa
quit:
    mov eax, 1              ; Número de llamada al sistema (sys_exit)
    xor ebx, ebx            ; Código de salida (0)
    int 0x80                ; Llama al kernel
