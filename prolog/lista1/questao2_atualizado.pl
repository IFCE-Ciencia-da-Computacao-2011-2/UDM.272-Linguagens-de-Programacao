% 2. Escreva um programa em Prolog especi cando os seguintes fatos e regras:

% Harry é um bruxo.
bruxo(harry).

% Hagrid assusta Dudley
assusta(hagrid, dudley).

% Todos os bruxos são seres mágicos.
ser_magico(X) :- bruxo(X).

% Tio Vernon odeia todos os seres mágicos.
odeia(tio_vernon, X) :- ser_magico(X).

% Tia Petunia odeia todos os seres mágicos ou quem assusta Dudley.
odeia(tia_petunia, X) :-
    ser_magico(X) 
  ; assusta(X, dudley).


% E faça as seguintes consultas:
:- begin_tests(questao_2).

%(a)  Tia Petunia odeia Hagrid?

test(tia_petunia_odeia_hagrid) :-
    odeia(tia_petunia, hagrid). 

%(b)  Quem o Tio Vernon odeia?
test(quem_tio_vernon_odeia) :-
    findall(X, odeia(tio_vernon, X), Resultados),
    
    assertion(member(harry, Resultados)),
    assertion(\+ member(hagrid, Resultados)),
    assertion(\+ member(dudley, Resultados)).

%(c)  Quem a Tia Petunia odeia?
test(quem_tia_petunia_odeia_4) :-
    findall(X, odeia(tia_petunia, X), Resultados),
    
    assertion(member(harry, Resultados)),
    assertion(member(hagrid, Resultados)),
    assertion(\+ member(dudley, Resultados)).

:- end_tests(questao_2).

:- run_tests.

% Não aprendi a usar
%:- show_coverage([]).
