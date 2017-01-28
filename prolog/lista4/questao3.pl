/*
3. Seja o programa em Prolog a abaixo. Um restaurante tem preço razoável se ele não
   é caro. Defina um predicado reasonable/1 que indica se um restautante tem preço
   razoável. Em seguida, faça uma consulta para mostrar os restaurantes com preço
   razoável e que são good_standard.
*/

cheap(junkburger).
good_standard(jeanluis).
good_standard(francesco).
expensive(jeanluis).

restautant(junkburger).
restautant(francesco).
restautant(jeanluis).

reasonable(X) :-
    restautant(X), not(expensive(X)).

consulta(X) :- reasonable(X), good_standard(X).