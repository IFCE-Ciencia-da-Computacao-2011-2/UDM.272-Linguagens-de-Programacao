/*
1. Imagine que a seguinte base de conhecimento descreve um labirinto. Os fatos determinam
quais os pontos são conectados, ou seja, a partir de que ponto você pode
chegar a qual outro ponto em um único passo. Além disso, imagine que todos os
caminhos são de sentido único, de modo que você só pode caminhar entre eles em
uma única direção. Assim, você pode partir do ponto 1 e chegar ao ponto 2, mas não
o contrário.
*/

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

/*
Escreva um predicado caminho/2 que diz de qual ponto no labirinto você pode chegar
a qual outro ponto quando encadeamos conexões dadas pela base acima. 
*/
caminho(PontoA, PontoB) :- connected(PontoA, PontoB).
caminho(PontoA, PontoB) :- connected(PontoA, PontoX),
                           caminho(PontoX, PontoB).

% Depois faça consultas em Prolog para cada item a seguir:
?- writeln("(a) E possível sair do ponto 5 e chegar no 10?").
?- writeln("caminho(5, 10)").
?- writeln("").
?- writeln("(b) Começando no ponto 1, em que pontos podemos chegar?").
?- writeln("caminho(1, Ponto).").
?- writeln("").
?- writeln("(c) Que pontos podemos chegar partindo do ponto 13?").
?- writeln("caminho(13, Ponto).").
?- writeln("").