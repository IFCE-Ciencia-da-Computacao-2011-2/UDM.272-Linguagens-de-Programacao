/*
Escreva uma regra para dizer que Maria gosta
de todos os animais com exceção dos ratos e
cobras
*/

rato(mickey).
rato(jerry).
gato(tom).
cobra(ekans).

animal(X) :-
    rato(X);
    gato(X);
    cobra(X).

gosta(maria, Animal) :-
    animal(Animal),
    \+ rato(Animal),
    \+ cobra(Animal).
