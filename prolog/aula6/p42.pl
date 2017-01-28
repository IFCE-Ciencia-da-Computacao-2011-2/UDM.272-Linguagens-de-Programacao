/*
Defina um predicado combine2/3 que
possui três listas como argumentos e
combina os elementos das duas primeiras
para obter a terceira como segue:
?- combine2([a,b],[1,2],X).
X  =  [[a,1],[b,2]]
*/

combine2([], [], []).
combine2([H1|T1], [H2|T2], [[H1, H2]| T3]) :-
    combine2(T1, T2, T3).
