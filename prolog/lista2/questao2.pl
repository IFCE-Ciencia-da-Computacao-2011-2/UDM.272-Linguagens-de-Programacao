/*
2. Defina um predicado fatorial/2 que calcula o fatorial de um número natural, ou
seja, fatorial(N, F) é verdade quando F é o fatorial de N.
*/

fatorial(0, 1).

fatorial(N, F) :- N > 0,
                  N_1 is N - 1,
                  fatorial(N_1, F1),
                  F is N * F1.                  
