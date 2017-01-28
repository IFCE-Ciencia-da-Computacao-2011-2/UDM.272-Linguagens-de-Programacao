
reverseAcc([], Lista, Lista).
reverseAcc([H|T], Acc, Reverted) :-
    reverseAcc(T, [H|Acc], Reverted).

rev(Lista, Reverted) :-
    reverseAcc(Lista, [], Reverted).
