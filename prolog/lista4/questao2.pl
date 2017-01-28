/*
2. Represente em Prolog um predicado somaLista/2 em que o o primeiro argumento
é uma lista de números e o segundo argumento é a soma dos elementos dessa lista.
Use recursão pela cauda.
*/

somaListaAcumulador([], Soma, Soma).
somaListaAcumulador([H|T], Acumulador, Resultado) :-
    AcumuladorNovo is H + Acumulador,
    somaListaAcumulador(T, AcumuladorNovo, Resultado).

somaLista(Lista, Resultado) :-
    somaListaAcumulador(Lista, 0, Resultado).
