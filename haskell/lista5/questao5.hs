-- 5. Defina a função safeHead que se comporta da mesma forma que head, exceto que
-- safeHead mapeia a lista vazia para a lista vazia, enquanto head retorna um erro
-- nesse caso.

-- ERROR
safeHead :: [a] -> a
safeHead [] = []
safeHead (x:xs) = x
