-- 4. Use currificação para definir uma função take6 que recebe um número n e uma lista e
-- retorna uma lista com os n primeiros elementos da lista. Use sua função para definir
-- a função sum6 que retorna a soma dos 6 primeiros elementos de uma lista de números.

--take6 ns = take 6 ns
--sum6 xs = sum (take6 xs)

take6 = \ns -> take 6 ns
sum6 = \xs -> sum (take6 xs)

--take6 = take 6
--sum6 = sum take6 