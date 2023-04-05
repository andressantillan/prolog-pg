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

sumar([], 0).
sumar([Cabeza|Resto], Resultado) :-
    sumar(Resto, ResultadoAux),
    Resultado is Cabeza + ResultadoAux.

/** Caso en que la lista esta vacia **/
posiciones_pares([], []).

/** Caso en que la lista solo tiene un elemento **/
posiciones_pares([Elemento], []).

/** Si la lista tiene mas de un elemento **/
posiciones_pares([_,Cabeza|Cola], [Cabeza|Resto]) :-
    posiciones_pares(Cola, Resto).

suma_posiciones_pares(Lista, Total) :- 
    posiciones_pares(Lista, ListaPares),
    sumar(ListaPares, Total).

generar_contrasenia([PrimerDigito|RestoDigitos], [R1, R2, R3]) :-
    factorial(PrimerDigito, R1),
    longitud([PrimerDigito|RestoDigitos], R2),
    suma_posiciones_pares([PrimerDigito|RestoDigitos], R3).
