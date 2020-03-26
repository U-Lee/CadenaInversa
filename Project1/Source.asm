.586
.model flat
.stack 1000h
.data
cadena  BYTE  "Cadena de prueba",0
cadenaInversa   BYTE "0"
extension = ($-cadena)-1
.code
inicio PROC
	
    MOV ESI,0
    MOV ECX,extension   ;Contador con el tamaño de la cadena

ingresa:      ;Inicia rutina de ingresar datos a la pila
    MOVZX EAX,cadena[ESI]   ;Extrae el primer dato de la cadena
    PUSH EAX     ;Mete el dato a la pila
    INC ESI
    LOOP ingresa    ;Ciclo regresa a la subrutina ingresa

    MOV ECX,6 ; reinicia el conteo  ;De nuevo reiniciamos contador
    MOV ESI,0

saca:   ;Inicia subrutina de sacar datos de la pila
    POP EAX  ;Saca el dato que esta en el tope de la pila
    MOV cadenaInversa[ESI], AL
    ;Guarda el dato obtenido 
    inc ESI
    LOOP saca   ;Ciclo saca
inicio ENDP

END
