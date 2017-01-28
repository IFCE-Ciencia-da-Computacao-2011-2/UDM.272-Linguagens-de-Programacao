% 1.  Represente as informações abaixo em Prolog:

% (a) - Butch é um assassino.
assassino(brutch).

% (b) Mia e Marsellus são casados.
casado(marsellus, mia).
casado(mia, marsellus).

% (c)  Zed está morto.
morto(zed).

% (d)  Marsellus mata todos que fazem massagem em Mia.
mata(marsellus, X) :- massageia(X, mia).

% (e)  Mia gosta de todos que são bons dançarinos.
gosta(mia, X) :- dancarino(X, bom).

% (f)  Jules come tudo que é nutritivo ou saboroso.
come(jules, X) : nutritivo(X).
come(jules, Y) : saboroso(X).
