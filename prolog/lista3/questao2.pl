/*
2. Escreva um predicado scalarMult/3 em que o primeiro elemento é
   um inteiro, o segundo é uma lista de inteiros e o terceiro é a
   lista resultante da multiplicação do primeiro argumento por todos
   os elementos do segundo
*/

scalarMult(_, [], []).
scalarMult(Integer, [X | T], [X1 | T2]) :- X1 is X * Integer,
                                           scalarMult(Integer, T, T2).

writeln(" > Teste").
writeln("scalarMult(5, [1, 2, 3, 4, 5], Result).").
