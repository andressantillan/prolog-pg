/**
Los auxiliares de contaduría de una empresa nos presentaron el siguiente problema:
Diariamente depositan una cantidad variable de cheques. Oportunamente, el banco informa el monto
total acreditado en la cuenta, sin detallar los importes que lo conforman, dándose la posibilidad de que
sólo algunos cheques se hubieran acreditado.
1. Dada la necesidad de reconocer qué cheques se acreditaron, solicitan un programa que les permita conocer
todas las posibilidades a partir de la consulta acredPosibles(ImportesDeCheques, MontoAcred,
ImportesPosibles).

?- acredPosibles([10, 12, 20, 30, 50, 60, 100], 282, X)
X = [10, 12, 20, 30, 50, 60, 100]
?- acredPosibles([10, 12, 20, 30, 50, 60, 100], 60, X)
X = [10, 20, 30]
X = [10, 50]
X = [60]
2. Definir una solución que permita además identificar a cada cheque.
**/

identificar([], []).
identificar([Cheque|Resto], [cheque(Id, Cheque)|RestoAux]) :-
    random(1, 999999, Id),
    identificar(Resto, RestoAux).


acredPosibles(Cheques, MontoAcred, Lista) :-
    identificar(Cheques, ChequesId),
    acredPosiblesAux(ChequesId, MontoAcred, Lista).

acredPosiblesAux([], 0, []).
acredPosiblesAux([cheque(Id, Monto)|Resto], MontoAcred, [cheque(Id, Monto)|RestoAux]) :-
    MontoAcred >= Monto,
    MontoAux is MontoAcred - Monto,
    acredPosiblesAux(Resto, MontoAux, RestoAux).

acredPosiblesAux([_|Resto], MontoAux, Lista) :-
    acredPosiblesAux(Resto, MontoAux, Lista).
    