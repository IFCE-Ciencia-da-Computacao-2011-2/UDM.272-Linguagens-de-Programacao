-- 2. Um inteiro positivo é perfeito se é igual a soma de todos os seus divisores, excluindo o
-- próprio número. Defina uma função perfects :: Int -> [Int]
-- que retorna a lista de todos os números perfeitos até um dado limite n
-- usando compreensões de listas. Por exemplo:
-- > perfects 500
-- [6,28,496]

divisores' :: Int -> [Int]
divisores' x = [d | d <- [1..(x-1)], x `mod` d == 0]

perfects :: Int -> [Int]
perfects n = [p | p <- [1..n], sum (divisores' p) == p]