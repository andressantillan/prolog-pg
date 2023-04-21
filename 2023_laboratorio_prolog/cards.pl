:- [hard_totals].

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

% Card values for Uston SS System
uston_system(2, 2).
uston_system(3, 2).
uston_system(4, 2).
uston_system(6, 2).
uston_system(5, 3).
uston_system(7, 1).
uston_system(8, 0).
uston_system(9, -1).
uston_system(10, -2).
uston_system(a, -2).
uston_system(j, -2).
uston_system(q, -2).
uston_system(k, -2).

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

% El crupier tiene una mano de 17, con un As valiendo 11.
soft_seventeen(Hand) :-
    hand(Hand, V),
    member(card(a, _), Hand),
    V = 17.

soft_dealer(Hand) :-
    soft_seventeen(Hand),
    print('Me planto.').

hard_dealer(Hand) :-
    soft_seventeen(Hand),
    print('Me paro de manos, sigo jugando'), !.

hard_total_strategy(Value, [card(N, _)|_]) :-
    hard_total(Value, N).

% El conteo comienza en -2, ya que hay un solo mazo en la mesa
uston_count([], -2).
uston_count([card(N, _)|RC], Count) :-
    uston_count(RC, CountAux),
    uston_system(N, Value),
    Count is CountAux + Value.

% Si el conteo es mayor a 0, quiere decir que hay menos cartas altas en juego
% Lo cual es favorable para el jugador.
player_strategy(_, _, Cards) :-
    uston_count(Cards, Count),
    Count > 0,
    print('Hit.').
    
% Si el conteo es menor a 0, es probable que la ventaja
% sea para el crupier.
% Pero se comprueba por una segunda estrategia.
% Se comprueba teniendo en cuenta el valor de la mano del jugador y una carta
% del dealer.
player_strategy(Hand, Crupier, _) :-
    hand(Hand, V),
    hard_total_strategy(V, Crupier),
    print('Hit.').

% Si falla la estrategia por hard totals
% El jugador se planta (stand).
player_strategy(_,_,_) :- 
    print('Stand'), false.

% Si se cumple, opta por strategia uston ss
play(Hand, Crupier, Cards) :-
    player_strategy(Hand, Crupier, Cards).