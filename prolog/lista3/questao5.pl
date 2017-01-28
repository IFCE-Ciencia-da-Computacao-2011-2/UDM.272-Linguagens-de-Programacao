/*
5. Descreva um programa em Prolog em que o usuário digita
   a quantidade de funcionários de uma empresa e o salário de cada
   funcionário. O programa deve dar um aumento de 7% para todos os
   funcionários e mostrar os novos salários.
   Além disso, seu programa deve mostrar a soma dos novos salários.
*/

input(Texto, Valor) :- 
    write(Texto),
    read(Valor).

quantidade(Q) :- input("Quantidade de funcionários: ", Q).
salario(S) :- input("Salário: ", S).

salarios(0, []).
salarios(Quantidade, [Salario | T]) :- 
    input(" - Salário: ", Salario),
    QuantosFaltam is Quantidade - 1,
    salarios(QuantosFaltam, T).

obterSalarios(Salarios) :-
    quantidade(Q),
    salarios(Q, Salarios).

aumentarSalario(AumentoPercentual, SalarioOriginal, NovoSalario) :-
    NovoSalario is SalarioOriginal * AumentoPercentual.

aumentarSalarios(_, [], []).
aumentarSalarios(AumentoPercentual, [Salario | T], [NovoSalario | T2]) :-
    aumentarSalario(AumentoPercentual, Salario, NovoSalario),
    aumentarSalarios(AumentoPercentual, T, T2).

executar() :-
    obterSalarios(Salarios),
    write("Salários: "),
    writeln(Salarios),
    aumentarSalarios(1.07, Salarios, SalariosAumentados),
    write("Salários aumentados: "),
    writeln(SalariosAumentados).
