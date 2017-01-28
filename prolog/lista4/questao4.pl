/*
4. Construa um predicado de subtração de conjuntos set_difference/3 em que os
conjuntos são representados por listas. Use o corte para evitar buscas desnecessárias.
*/

set_difference([], _, []).

set_difference([H1|T1], Lista2, [H1|Tdiferenca]) :-
    \+ member(H1, Lista2),
    !,
    set_difference(T1, Lista2, Tdiferenca).

set_difference([H1|T1], Lista2, Diferenca) :-
    member(H1, Lista2),
    !,
    set_difference(T1, Lista2, Diferenca).
