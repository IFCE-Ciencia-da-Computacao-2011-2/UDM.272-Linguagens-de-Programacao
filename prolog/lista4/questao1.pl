/*
1. Defina um predicado fatorial/2 que calcula o fatorial de um número natural, ou
seja, fatorial(N, F) é verdade quando F é o fatorial de N. Use recursão pela cauda.
*/

fatorialAcumulador(0, Acumulador, Acumulador) :- !.
fatorialAcumulador(N, Acumulador, Resultado) :-
    AcumuladorNovo is Acumulador * N,
    N_1 is N-1,
    fatorialAcumulador(N_1, AcumuladorNovo, Resultado).

fatorial(Numero, Resultado) :-
    fatorialAcumulador(Numero, 1, Resultado).
