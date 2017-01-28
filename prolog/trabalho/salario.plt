:- begin_tests(salario).
%:- use_module(salario).

test(aumentarSalario) :-
	salario:aumentarSalario(1.07, 100, NovoSalario),
	NovoSalario =:= 107.0.

test(aumentarSalarioNegativo) :-
	salario:aumentarSalario(1.07, -100, NovoSalario),
	NovoSalario =:= -107.0.

test(descobrirSalarioAnterior, [fail]) :-
	salario:aumentarSalario(1.07, _, 107).

:- end_tests(salario).