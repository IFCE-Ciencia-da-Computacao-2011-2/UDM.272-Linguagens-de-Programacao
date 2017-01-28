/*
3. Represente em Prolog um predicado somaLista/2 em que
   o primeiro argumento é uma lista de números e o segundo
   argumento é a soma dos elementos dessa lista.
*/

% http://stackoverflow.com/a/12413025/1524997

somaLista([], 0).
somaLista([Head | Tail], Soma) :- somaLista(Tail, SomaInterna),
                                  Soma is SomaInterna + Head.