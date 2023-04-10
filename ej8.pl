/**Definir un programa Prolog que permita determinar el mejor vuelto a dar a una persona que abona una suma de
dinero. Se debe tener en cuenta que:
• Los montos a abonar son enteros.
• El mejor vuelto es aquél que contiene la menor cantidad de billetes.
• Para dar vuelto se poseen billetes con las siguientes numeraciones 1, 2, 5, 10, 20, 50, 100, 200,
500 y 1000.
El programa debe responder a consultas del tipo:
?- mejorVuelto(100, 86, Lista)
Lista = [10, 2, 2]**/

% Queda por ver que hacemos con el resto.

billetes([1, 2, 5, 10, 20, 50, 100, 200, 500, 1000]).

sumar([], 0).
sumar([Cabeza|Resto], Resultado) :-
    sumar(Resto, ResultadoAux),
    Resultado is Cabeza + ResultadoAux.

combinacion(0, Billete, []).
combinacion(Importe, Billete, Lista) :-
    Importe < Billete,
    vuelto(Importe, Lista).
    
combinacion(Importe, Billete, [Billete|OtrosBilletes]) :-
    Importe >= Billete,
    NuevoImporte is Importe-Billete,
    combinacion(NuevoImporte, Billete, OtrosBilletes).

vuelto(Importe, Lista) :-
    billetes(B),
    member(X, B),
    Importe > X,
    combinacion(Importe, X, Lista).