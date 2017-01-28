/*
 1. Defina um predicado tem_0(List) que indica se a lista de entrada
    possui 0 como elemento.
*/

tem_0([Head | _]) :- Head = 0.
tem_0([_ | Tail]) :- tem_0(Tail).
