/**En revistas y diarios suelen aparecer problemas como el siguiente:
Instrucciones: colocar en los cuadros en blanco las cifras (de 0 a 9) correspondientes para que, vertical
y horizontalmente, efectuando las operaciones indicadas, den la solución reseñada.
Para resolver este problema se pide codificar el predicado result(A1,A2,A3,B1,B3,C1,C2,C3), que dé
el o los resultados factibles para:
(A1  A2) x A3 = 6
(B1 x 5) - B3 = 1
(C1 - C2) x C3 = 4
(A1 - B1) x C1 = 7
(A2 + 5) div C2 = 1
(A3 + B3) - C3 = 7 **/

result(A1, A2, A3, B1, B3, C1, C2, C3) :-
    between(0, 9, A1),
    between(0, 9, A2),
    between(0, 9, A3),
    between(0, 9, B1),
    between(0, 9, B3),
    between(0, 9, C1),
    between(0, 9, C2),
    between(0, 9, C3),
    (B1*5)-B3 =.= 1,
    (A1*A2)*A3 =.= 6,
    (C1-C2)*C3 =.= 4,
    (A1-B1)*C1 =.= 7,
    (A2 + 5)/C2 =.= 1,
    (A3+B3)-C3 =.= 7.