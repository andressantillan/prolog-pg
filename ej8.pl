/**Definir un programa Prolog que permita determinar el mejor vuelto a dar a una persona que abona una suma de
dinero. Se debe tener en cuenta que:
• Los montos a abonar son enteros.
• El mejor vuelto es aquél que contiene la menor cantidad de billetes.
• Para dar vuelto se poseen billetes con las siguientes numeraciones 1, 2, 5, 10, 20, 50, 100, 200,
500 y 1000.
El programa debe responder a consultas del tipo:
?- mejorVuelto(100, 86, Lista)
Lista = [10, 2, 2]**/

billete([1,2,5,10,20,50,100,200,500,1000]).

/** Primero obtener el resto **/
combinacion(0, []).
combinacion(1, [1]).
combinacion(Numero, Resultado) :-
    billete([PrimerBillete|RestoBilletes]),
    combinacion(Lista, ListaAux).



