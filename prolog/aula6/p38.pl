/*
 Aula 06 - Prolog - Listas
 página 37-38
 https://dl.dropboxusercontent.com/u/4914805/disciplinas/2016-1/lip/aulas/Aula%2006%20-%20Prolog%20-%20Listas.pdf
*/

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).

listtran([PalavraAlemao | CaldaAlemao], [PalavraIngles | CaldaIngles]) :-
    tran(PalavraAlemao, PalavraIngles),
    listtran(CaldaAlemao, CaldaIngles).