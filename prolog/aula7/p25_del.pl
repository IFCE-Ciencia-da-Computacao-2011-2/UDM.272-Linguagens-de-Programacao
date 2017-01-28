
del(X, [X|L1], L1).
del(X, [H|T], [H|T2]) :-
    del(X, T, T2).