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
?- writeln("(a)  Tia Petunia odeia Hagrid?").
?- writeln("odeia(tia_petunia, hagrid).").
?- writeln("").

?- writeln("(b)  Quem o Tio Vernon odeia?").
?- writeln("odeia(tio_vernon, X).").
?- writeln("").

?- writeln("(c)  Quem a Tia Petunia odeia?").
?- writeln("odeia(tia_petunia, X).").
?- writeln("").
