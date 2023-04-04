/**
Codificar las reglas:
 Pertenece-member-está
 Longitud
 Agregar un elemento a la cabeza
 Agregar un elemento en una posición determinada
 Concatenar dos listas
**/

pertenece(Elemento, [Elemento|_]).
pertenece(Elemento, [_|Resto]) :- pertenece(Elemento, Resto).

longitud([], 0).
longitud([Inicio|Resto], Cantidad) :- longitud(Resto, CantidadRestante), Cantidad is CantidadRestante + 1.

/**agregar(Elemento, Lista, ListaNueva) :- ListaNueva = [Elemento|Lista].**/
agregar(Elemento, Lista, [Elemento|Lista]).

/* Cuando la lista no tiene elementos */
agregar_en_posicion(Elemento, Posicion, [], [Elemento]).  

/* Cuando hay que insertar en la primera posicion */
agregar_en_posicion(Elemento, 0, Lista, [Elemento|Lista]).

agregar_en_posicion(Elemento, Posicion, [Cabeza|Resto],  [Cabeza|ListaNueva]) :-
    PosicionNueva is Posicion-1,
    agregar_en_posicion(Elemento, PosicionNueva, Resto, ListaNueva).

/** Caso la lista a concatenar esta vacia **/
concatenar([], Lista, Lista).
concatenar([Cabeza|Cola], Lista, [Cabeza|Resto]) :-
    concatenar(Cola, Lista, Resto).
