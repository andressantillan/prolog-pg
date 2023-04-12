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

combinacion(0, [], MontoAcred, Subtotal, 0).
combinacion(ImporteCheque, [Cheque|RestoCheques], MontoAcred, Subtotal, [Cheque|RestoChequesAux]) :-
    SubtotalAux is Cheque + ImporteCheque,
    Subtotal =< MontoAcred,
    combinacion(ImporteCheque, RestoCheques, MontoAcred, SubtotalAux, RestoChequesAux).

acredPosibles([], 0, []).
acredPosibles([Cheque|RestoCheques], MontoAcred, Lista) :-
    