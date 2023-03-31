/**
Dado un programa con hechos del tipo primario(Color) y formadoPor(Color, Color, Color), construir las siguientes reglas:
• secundario(X): determina si X es secundario, es decir está formado por dos colores primarios.
• complementarios(X,Y): un color X es complementario de un color primario Y, cuando X se forma con
dos colores primarios entre los cuales Y no se encuentra. Debe utilizar la regla anterior.

**/

primario(rojo).
primario(azul).
primario(amarillo).

formadoPor(verde, amarillo, azul).
formadoPor(violeta, rojo, azul).
formadoPor(naranja, amarillo, rojo).

secundario(X) :- formadoPor(X, Color1, Color2), primario(Color1), primario(Color2).

complementario(X, Y) :- secundario(X), \+formadoPor(X, Y, Color),  \+formadoPor(X, Color, Y).