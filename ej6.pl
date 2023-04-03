teclado(2, [a, b, c]).
teclado(3, [d, e, f]).
teclado(4, [g, h, i]).
teclado(5, [j, k, l]).
teclado(6, [m, n, o]).
teclado(7, [p, q, r, s]).
teclado(8, [t, u, v]).
teclado(9, [w, x, y, z]).

pertenece(Elemento, [Elemento|_]).
pertenece(Elemento, [_|Resto]) :- pertenece(Elemento, Resto).

/** Relacion para obtener una Letra del conjunto de Letras del Numero **/
letra(Numero, Letra) :-
    teclado(Numero, Letras),
    pertenece(Letra, Letras).

/** Relacion para obtener las Letras de un numero**/
conversion(Numero, Letras) :-
    letra(Numero, Letras).

conversion([], []).
conversion([Numero|RestoNumeros], [Letra|RestoLetras]) :-
    conversion(RestoNumeros, RestoLetras),
    letra(Numero, Letra).

/**
    2. Con tu resolución, ¿qué sucede si la consulta es conversion(X, ["a", "e"])? 
    Me devuelve las lista de numeros al cual pertenece esa combinacion de letras.
**/

