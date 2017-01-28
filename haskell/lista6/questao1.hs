-- Uma tripla (x; y; z) de inteiros positivos é chamada pitagórica se
-- x²+y²=z². Usando compreensões de listas, defina a função pyths :: Int -> [(Int,Int,Int)]
-- que mapeia um inteiro n para todas as triplas pitagóricas com componentes em [1::n]. Por exemplo:
-- > pyths 5
-- [(3,4,5),(4,3,5)]

pyths :: Int -> [(Int,Int,Int)]
pyths x = [(a, b, c) | a <- [1..x], b <- [1..x], c <- [1..x], c^2 == a^2 + b^2]