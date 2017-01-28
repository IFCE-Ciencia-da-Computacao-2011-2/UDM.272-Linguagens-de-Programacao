%1- Descreva um predicado para descobrir todas as sublistas de uma lista
%   As sublistas são os prefixos dos sufixos
?- [p08_prefix].
?- [p12_sufix].

sublist(Sublist, L) :-
    sufix(Sufix, L),
    prefix(Sublist, Sufix).