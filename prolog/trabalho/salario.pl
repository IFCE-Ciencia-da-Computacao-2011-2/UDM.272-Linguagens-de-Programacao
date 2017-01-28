aumentarSalario(AumentoPercentual, SalarioOriginal, NovoSalario) :-
    NovoSalario is SalarioOriginal * AumentoPercentual.

aumentarSalarios(_, [], []).
aumentarSalarios(AumentoPercentual, [Salario | T], [NovoSalario | T2]) :-
    aumentarSalario(AumentoPercentual, Salario, NovoSalario),
    aumentarSalarios(AumentoPercentual, T, T2).
