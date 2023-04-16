card(a,c).
card(2,c).
card(3,c).
card(4,c).
card(5,c).
card(6,c).
card(7,c).
card(8,c).
card(9,c).
card(10,c).
card(j,c).
card(q,c).
card(k,c).

card(a,p).
card(2,p).
card(3,p).
card(4,p).
card(5,p).
card(6,p).
card(7,p).
card(8,p).
card(9,p).
card(10,p).
card(j,p).
card(q,p).
card(k,p).

card(a,t).
card(2,t).
card(3,t).
card(4,t).
card(5,t).
card(6,t).
card(7,t).
card(8,t).
card(9,t).
card(10,t).
card(j,t).
card(q,t).
card(k,t).

card(a,d).
card(2,d).
card(3,d).
card(4,d).
card(5,d).
card(6,d).
card(7,d).
card(8,d).
card(9,d).
card(10,d).
card(j,d).
card(q,d).
card(k,d).


value(card(a,_), 1).
value(card(a,_), 11).
value(card(k,_), 10).
value(card(j,_), 10).
value(card(q,_), 10).
value(card(N,_), N) :- integer(N), between(1, 10, N).

longitud([], 0).
longitud([_|Resto], Cantidad) :- 
    longitud(Resto, CantidadRestante), 
    Cantidad is CantidadRestante + 1.

/* hand(Hand, Value)*/
hand([], 0).
hand([card(Number, Suit)|RC], Value) :-
    hand(RC, ValueAux),
    value(card(Number, Suit), X),
    Value is X + ValueAux.

twentyone(Hand) :-
    hand(Hand, V),
    21 is V.

over(Hand) :-
    hand(Hand, V),
    V > 21.

blackjack(Hand) :-
    longitud(Hand, Cantidad),
    Cantidad = 2,
    hand(Hand, V),
    V = 21.

classic_dealer_seventeen(Hand) :-
    hand(Hand, V),
    V >= 17, 
    print('Me planto.').

classic_dealer_sixteen(Hand) :-
    hand(Hand, V),
    V =< 16,
    print('Me paro de manos, sigo jugando.').


% Implementar la regla soft_seventeen
soft_dealer(Hand) :-
    classic_dealer_seventeen(Hand),
    member(card(a, _), Hand),
    print('Me planto.').

hard_dealer(Hand) :-
    classic_dealer_seventeen(Hand),
    print('Me paro de manos, sigo jugando').


