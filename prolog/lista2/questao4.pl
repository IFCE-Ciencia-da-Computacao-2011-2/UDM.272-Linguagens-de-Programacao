/*
4. A figura abaixo é uma cruzadinha em que as células rotuladas devem ser preenchidas com letras.
As palavras que podem ser usadas e suas letras são representadas pelos fatos a seguir:

   |  V1      V2      V3
-----------------------------
H1 |  L1  L2  L3  L4  L5 |||
   |  L6 |||  L7 |||  L8 |||
H2 |  L9 L10 L11 L12 L13 L14
   | L15 ||| ||| ||| L16 |||

*/

word(dog, d,o,g).
word(run, r,u,n).
word(top, t,o,p).
word(five, f,i,v,e).
word(four, f,o,u,r).
word(lost, l,o,s,t).
word(mess, m,e,s,s).
word(unit, u,n,i,t).
word(baker, b,a,k,e,r).
word(forum, f,o,r,u,m).
word(green, g,r,e,e,n).
word(super, s,u,p,e,r).
word(prolog, p,r,o,l,o,g).
word(vanish, v,a,n,i,s,h).
word(wonder, w,o,n,d,e,r).
word(yellow, y,e,l,l,o,w).

/*
Faça um programa em Prolog para indicar como completar a cruzadinha.
Você pode definir um predicado cruzadinha/5 em que os dois primeiros argumentos devem ser
as palavras na horizontal e os três seguintes devem ser as palavras na vertical.
*/

cruzadinha(H1, H2, V1, V2, V3) :- word(H1, L1, _, L3, _, L5),
                                  word(H2, L9, _, L11, _, L13, _),
                                  word(V1, L1, _, L9, _),
                                  word(V2, L3, _, L11),
                                  word(V3, L5, _, L13, _).