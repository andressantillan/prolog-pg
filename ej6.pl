/**Conociendo la relación existente en los teclados de los teléfonos celulares de los números con las letras,
Número Letras
2 a b c
3 d e f
4 g h i
5 j k l
6 m n o
7 p q r s
8 t u v
9 w x y z
y sabiendo que en la base de conocimiento, aparece sólo una vez cada número del teclado, se pide:
1. Codificar el predicado conversion (y sus auxiliares) tal que dada una lista de números genere las listas de
letras factibles.
2. Con tu resolución, ¿qué sucede si la consulta es conversion(X, ["a", "e"])?
Ejemplos:
?- conversion ([2, 3], X)
X = [‘a’, ‘d’]
X = [‘b’, ‘d’]
X = [‘c’, ‘d’]
X = [‘a’, ‘e’]
X = [‘b’, ‘e’]
X = [‘c’, ‘e’]
X = [‘a’, ‘f’]
X = [‘b’, ‘f’]
X = [‘c’, ‘f’]
false
?- conversion ([2, 3], [‘a’, ‘e’])
True**/

teclado(2, ["a", "b", "c"]).
teclado(3, ["d", "e", "f"]).
teclado(4, ["g", "h", "i"]).
teclado(5, ["j", "k", "l"]).
teclado(6, ["m", "n", "o"]).
teclado(7, ["p", "q", "r", "s"]).
teclado(8, ["t", "u", "v"]).
teclado(9, ["w", "x", "y", "z"]).

pertenece(Elemento, [Elemento|_]).
pertenece(Elemento, [_|Resto]) :- pertenece(Elemento, Resto).

/** Me devuelve una letra de un numero **/



