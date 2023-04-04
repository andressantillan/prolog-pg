/**El servicio de Web Mail de un portal calcula la contraseña de los usuarios en base al número de usuario (el cual se
tiene como una lista de dígitos). La contraseña es de tres números y los calcula de la siguiente forma:
• Primer dígito: factorial del primer dígito del número de usuario.
• Segundo dígito: longitud del número de usuario.
• Tercer dígito: suma de los dígitos de las posiciones pares del número de usuario.
Escribir un programa Prolog que en base a un número de usuario calcule la contraseña.
Ejemplo:
?- generar_contraseña([2, 3, 7, 1, 6, 8], Contrasenia)
Contrasenia = [2, 6, 12]
?- generar_contraseña([2, 3, 7, 1, 6, 8], [3, 5, 7])
False**/

factorial(0, 1).
factorial(Numero, Resultado) :-
    NumeroAux is Numero-1,
    factorial(NumeroAux, ResultadoAux),
    Resultado is Numero * ResultadoAux.

longitud([], 0).
longitud([Inicio|Resto], Cantidad) :- 
    longitud(Resto, CantidadRestante), Cantidad is CantidadRestante + 1.

es_par(Numero) :- 0 is Numero mod 2.

sumar([], 0).
sumar([Cabeza|Resto], Resultado) :-
    sumar(Resto, ResultadoAux),
    Resultado is Cabeza + ResultadoAux.

sumar_pares([], 0).
sumar_pares([Cabeza|Resto], Resultado) :-