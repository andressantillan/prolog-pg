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

% agregar(Elemento, Lista, ListaNueva) :- ListaNueva = [Elemento|Lista].
agregar(Elemento, Lista, [Elemento|Lista]).

}



agregar_en_posicion(Elemento, Posicion, [_|Resto], ListaNueva) :-
    agregar_en_posicion(Elemento, PosicionNueva, Resto, ListaNueva),
    PosicionNueva is Posicion-1.
    