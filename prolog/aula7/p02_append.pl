/*
append([], [], []).

append([], [H2|T2], [H2|T3]) :-
    append([], T2, T3).
*/

append([], Lista2, Lista2).

append([H1|T1], Lista2, [H1|T3]) :-
    append(T1, Lista2, T3).
