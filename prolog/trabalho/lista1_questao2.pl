% Manual: http://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)
% Lista: https://dl.dropboxusercontent.com/u/4914805/disciplinas/2016-1/lip/listas/Lista%2001%20-%20Introdu%C3%A7%C3%A3o%20ao%20Prolog.pdf

% 2. Escreva um programa em Prolog especi cando os seguintes fatos e regras:
% Harry é um bruxo.
bruxo(harry).

% Hagrid assusta Dudley
assusta(hagrid, dudley).
assustado(X, Y) :- assusta(Y, X).

% Todos os bruxos são seres mágicos.
ser_magico(X) :- bruxo(X).

% Tio Vernon odeia todos os seres mágicos.
odeia(tio_vernon, X) :- ser_magico(X).

% Tia Petunia odeia todos os seres mágicos ou quem assusta Dudley.
odeia(tia_petunia, X) :- ser_magico(X).
odeia(tia_petunia, X) :- assusta(X, dudley).

% E faça as seguintes consultas:
:- begin_tests(lista1_questao_2).

% =============================
% Testar uma coisa
% =============================
%(a)  Tia Petunia odeia Hagrid?

test(tia_petunia_odeia_hagrid) :-
    odeia(tia_petunia, hagrid). 

% =============================
% Várias assertivas em um mesmo teste
% =============================
%(b)  Quem o Tio Vernon odeia?
test(quem_tio_vernon_odeia) :-
    odeia(tio_vernon, X),
    assertion(X = harry),
    assertion(X \= hagrid),
    assertion(X \= dudley).

% =============================
% Testing non-deterministic predicates
% =============================
%(c)  Quem a Tia Petunia odeia?
% Resposta: harry e hagrid

% X não pode unificar com harry e hagrid ao mesmo tempo!
test(quem_tia_petunia_odeia_0) :-
    odeia(tia_petunia, X),
    assertion(X = harry),
    assertion(X = hagrid),  % Falha
    assertion(X \= dudley).

test(quem_tia_petunia_odeia_1) :-
    odeia(tia_petunia, X),
    X = harry. % Test succeeded with choicepoint (????)

% Para silenciar "Test succeeded with choicepoint", utilizar [nondet]
test(quem_tia_petunia_odeia_2, [nondet]) :-
    odeia(tia_petunia, X),
    X = harry.

% Pegar todos os resultados e comparar
% Obs: A ordem é relevante
test(quem_tia_petunia_odeia_3) :-
    findall(X, odeia(tia_petunia, X), Resultados),
    
    Resultados = [harry, hagrid].

% Verificar de um por um
test(quem_tia_petunia_odeia_4) :-
    findall(X, odeia(tia_petunia, X), Resultados),
    
    assertion(member(harry, Resultados)),
    assertion(member(hagrid, Resultados)),
    assertion(\+ member(dudley, Resultados)).


:- end_tests(lista1_questao_2).

:- run_tests.

% Não aprendi a usar
:- show_coverage([]).