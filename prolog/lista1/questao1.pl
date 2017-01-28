% 1.  Represente as informações abaixo em Prolog:

% (a) - Butch é um assassino.
assasino(butch).

% (b) Mia e Marsellus são casados.
casado(marsellus, mia).
casado(mia, marsellus).

casados(X, Y) :- casado(X, Y), casado(Y, X).

% (c)  Zed está morto.
morto(zed).

% (d)  Marsellus mata todos que fazem massagem em Mia.
%massagem(X, Y).
mata(marsellus, X) :- massagem(X, mia).

% (e)  Mia gosta de todos que são bons dançarinos.
gosta(mia, X) :- bom(dançarino, X).

% (f)  Jules come tudo que é nutritivo ou saboroso.
come(jules, nutritivo).
come(jules, saboroso).
