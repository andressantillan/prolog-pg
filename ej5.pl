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