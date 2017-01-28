% 3. Seja a seguinte base de conhecimento de informações de viagens:

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

writeln("(a) Escreva um predicado travel/2 que determina se é possível viajar").
writeln("    de um local para outro usando qualquer meio de transporte.").


travel_direct(LocateA, LocateB) :- byCar(LocateA, LocateB).
travel_direct(LocateA, LocateB) :- byTrain(LocateA, LocateB).
travel_direct(LocateA, LocateB) :- byPlane(LocateA, LocateB).

travel(LocateA, LocateB) :- travel_direct(LocateA, LocateB).
travel(LocateA, LocateB) :- travel_direct(LocateA, X),
                            travel(X, LocateB).

%writeln("").

%writeln("(b) Defina um predicado travel/3 que indica como viajar de um local para outro.").
%writeln("Por exemplo,").

%writeln("?- travel(valmont,paris,go(valmont,metz,go(metz,paris))).").
%writeln("true.").

%writeln("?- travel(valmont,losAngeles,X).").
%writeln("X = go(valmont,metz,go(metz,paris,go(paris,losAngeles))).").
%writeln("").

travel(LocateA, LocateB, go(LocateA, LocateB)) :- travel_direct(LocateA, LocateB).
travel(LocateA, LocateB, go(LocateA, X, Path)) :- travel_direct(LocateA, X),
                                                  travel(X, LocateB, Path).


%writeln("(c) Modifique o seu programa para mostrar também quais meios de transporte devem ser utilizado entre as cidades no caminho.").
travel_direct_how(LocateA, LocateB, car) :- byCar(LocateA, LocateB).
travel_direct_how(LocateA, LocateB, train) :- byTrain(LocateA, LocateB).
travel_direct_how(LocateA, LocateB, plane) :- byPlane(LocateA, LocateB).

travel_how(LocateA, LocateB, go(LocateA, LocateB, Transport)) :- travel_direct_how(LocateA, LocateB, Transport).
travel_how(LocateA, LocateB, go(LocateA, X, Transport, Path)) :- travel_direct_how(LocateA, X, Transport),
                                                                 travel_how(X, LocateB, Path).
