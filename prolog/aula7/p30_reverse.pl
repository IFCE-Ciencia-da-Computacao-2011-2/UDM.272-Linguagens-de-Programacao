?- [p02_append].

reverse([], []).

reverse([H|T], Reverted) :-
    reverse(T, Treverted),
    append(Treverted, [H], Reverted).
    