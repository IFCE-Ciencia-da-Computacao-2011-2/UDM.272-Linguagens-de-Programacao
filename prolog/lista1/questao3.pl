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


% why not?
%parents_of(ParentA, ParentB, People) :- parent_of(ParentA, People),
%                                        parent_of(ParentB, People).
%parents_of(paul, helen, petunia).

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
father_of(Father, People) :- parent_of(Father, People),
                             male(Father).

% =============================
% mother_of/2
% =============================
mother_of(Mother, People) :- parent_of(Mother, People),
                             female(Mother).

% =============================
% grandfather_of/2
% =============================
grandfather_of(Grandfather, People) :- father_of(Grandfather, Father), 
                                       father_of(Father, People).
grandfather_of(Grandfather, People) :- father_of(Grandfather, Mother), 
                                       mother_of(Mother, People).

%grandfather_of(G, P) :- father_of(G, X),
%                        mother_of(X, P); father_of(X, P).

% =============================
% grandmother_of/2
% =============================
grandmother_of(Grandmother, People) :- mother_of(Grandmother, Father), 
                                       father_of(Father, People).
grandmother_of(Grandmother, People) :- mother_of(Grandmother, Mother), 
                                       mother_of(Mother, People).

%grandmother_of(G, P) :- father_of(G, X),
%                        mother_of(X, P); father_of(X, P).

% =============================
% sister_of/2
% =============================
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
?- writeln("(a)  Harry tem tia?  Quem?").
?- writeln("aunt_of(Aunt, harry)").
?- writeln("").

?- writeln("(b)  Quem são os avós de Harry?").
?- writeln("grandmother_of(Grandmother, harry); grandfather_of(Grandfather, harry).").
?- writeln("").

?- writeln("(c)  Quem são os netos de Paul e Helen?").
?- writeln("grandmother_of(paul, Grandchild), grandfather_of(helen, Grandchild).").
?- writeln("").

?- writeln("(d)  James tem irmã?").
?- writeln("sister_of(X, james).").
?- writeln("").