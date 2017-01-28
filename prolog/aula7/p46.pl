/*
Uma rua tem três casas vizinhas que
possuem cores diferentes: r, b e g.
Pessoas de diferentes nacionalidades
vivem em casas diferentes e possuem
pets diferentes.
• O inglês vive na casa red
• O jaguar é o pet do espanhol
• O japonês mora vizinho à direita do sapo
• O sapo fica vizinho à esquerda da blue
• Quem é dono da zebra?
*/

?- [p15_sublist].

/*
casas([red, green, blue]).
nacionalidades([ingles, espanhol, japones]).
pets([jaguar, sapo, zebra]).

combinacao(Casa, Nacionalidade, Pet) :-
    casas(Cs), member(Casa, Cs),
    nacionalidades(Ns), member(Nacionalidade, Ns),
    pets(Ps), member(Pet, Ps).
*/

zebra(Dono, Pet) :-
    Rua = [_, _, _],
    member(combinacao(red, ingles, _), Rua),
    member(combinacao(_, espanhol, jaguar), Rua),
    member(combinacao(_, Dono, zebra), Rua),
    
    sublist([combinacao(_, _, sapo), combinacao(_, japones, _)], Rua),
    sublist([combinacao(_, _, sapo), combinacao(blue, _, _)], Rua).