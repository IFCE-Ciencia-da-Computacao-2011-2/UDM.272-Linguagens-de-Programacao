/*
4. Mostre uma definição para o predicado element(N, List, R)
   que indica se R é o elemento da lista List que está na posição N.
*/

element(N, [X | _], 0) :- N is X.
element(N, [_ | Tail], R) :- Index is R-1,
                             element(N, Tail, Index).