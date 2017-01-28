?- [p02_append].

toptail(List1, List2) :- 
   append([_|List2], [_], List1).
   % List 1 = Combinação de duas listas 
   %  onde a primeira ignora-se o primeiro elemento [_|List2]
   %  e a segunda só possui um elemento, que é ignorado [_].
