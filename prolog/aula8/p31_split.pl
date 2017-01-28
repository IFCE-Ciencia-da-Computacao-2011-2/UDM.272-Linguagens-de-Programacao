/*
Sem usar corte, defina o predicado split/3
que divide uma lista de inteiros em duas listas:
uma com os não-negativos e a outra com os
negativos
*/

split([], [], []).

split([H|T], Positivos, [H|Tnegativos]) :-
    H < 0,
    !,
    split(T, Positivos, Tnegativos).

split([H|T], [H|Tpositivos], Negativos) :-
    split(T, Tpositivos, Negativos).
