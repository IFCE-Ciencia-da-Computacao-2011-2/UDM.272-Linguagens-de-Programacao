/*
Use os predicados male/1, female/1 e parent_of/2 para  representar  a  seguinte árvore genealógica em um programa em Prolog.

             Paul        Helen       Albert  Ruth
               \-----------/            \----/
                     |                    |
             |-------------|            James
Vernon     Petunia        Lili            |
  \----|----/               \------|------/
    Dudley                       Harry
*/

male(paul).
male(albert).
male(vernon).
male(james).
male(dudley).
male(harry).

female(helen).
female(ruth).
female(petunia).
female(lili).

parent_of(paul, petunia).
parent_of(helen, petunia).

parent_of(paul, lili).
parent_of(helen, lili).

parent_of(albert, james).
parent_of(ruth, james).

parent_of(vernon, dudley).
parent_of(petunia, dudley).

parent_of(lili, harry).
parent_of(james, harry).

% *****************************
% E crie regras para os predicados:
% *****************************

% =============================
% father_of/2
% =============================
father_of(Father, People) :-
    male(Father),
    parent_of(Father, People).

% =============================
% mother_of/2
% =============================
mother_of(Mother, People) :-
    female(Mother),
    parent_of(Mother, People).

% =============================
% grandfather_of/2
% =============================
grandfather_of(Grandfather, People) :-
    father_of(Grandfather, X),
    parent_of(X, People).

% =============================
% grandmother_of/2
% =============================
grandmother_of(Grandmother, People) :-
    mother_of(Grandmother, X),
    parent_of(X, People).

% =============================
% sister_of/2
% =============================
sister_of(Sister, People) :-
    female(Sister),
    parent_of(Parent, Sister),
    parent_of(Parent, People),
    People =\= Sister.

/*
% sibling = each of two or more children or offspring having one or both parents in common; a brother or sister.
sibling(PeopleA, PeopleB) :- father_of(Father, PeopleA),
                             father_of(Father, PeopleB),
                             mother_of(Mother, PeopleA),
                             mother_of(Mother, PeopleB),
                             PeopleA \= PeopleB.

sister_of(Sister, People) :- sibling(Sister, People),
                             female(Sister).

brother_of(Brother, People) :- sibling(Brother, People),
                               male(Brother).
*/
% =============================
% aunt_of/2
% =============================
aunt_of(Aunt, People) :- father_of(Father, People),
                         sister_of(Aunt, Father).
aunt_of(Aunt, People) :- mother_of(Mother, People),
                         sister_of(Aunt, Mother).

% =============================
% uncle_of/2
% =============================
uncle_of(Uncle, People) :- father_of(Father, People),
                           sibling(Uncle, Father),
                           brother_of(Uncle, Father).
uncle_of(Uncle, People) :- mother_of(Mother, People),
                           sibling(Uncle, Mother),
                           brother_of(Uncle, Mother).

% *****************************
% Faça as seguintes consultas:
% *****************************
:- begin_tests(questao_3).

%(a)  Harry tem tia?  Quem?
test(tia_de_harry) :-
    findall(
        Aunt,
        aunt_of(Aunt, harry),
        Resultados
    ),
    
    Resultados == [Petunia].


%(b)  Quem são os avós de Harry?
test(quem_avos_de_harry) :-
    findall(X, grandfather_of(X, harry), Grandfathers),
    findall(X, grandmother_of(X, harry), Grandmothers),
    
    assertion(member(paul, Grandfathers)),
    assertion(member(albert, Grandfathers)),
    
    assertion(member(helen, Grandmothers)),
    assertion(member(ruth, Grandmothers)).

%(c)  Quem são os netos de Paul e Helen?
test(quem_netos_de_paul_helen) :-
    grandmother_of(paul, Grandchild), grandfather_of(helen, Grandchild).
    
    findall(X, grandfather_of(X, harry), Grandfathers),
    findall(X, grandmother_of(X, harry), Grandmothers),
    
    assertion(member(paul, Grandfathers)),
    assertion(member(albert, Grandfathers)),
    
    assertion(member(helen, Grandmothers)),
    assertion(member(ruth, Grandmothers)).

test(quem_tia_petunia_odeia_4) :-
    findall(X, odeia(tia_petunia, X), Resultados),
    
    assertion(member(helen, Resultados)),
    assertion(member(ruth, Resultados)),
    assertion(\+ member(dudley, Resultados)).



?- writeln("(d)  James tem irmã?").
?- writeln("sister_of(X, james).").
?- writeln("").

:- end_tests(questao_2).

:- run_tests.

% Não aprendi a usar
%:- show_coverage([]).


