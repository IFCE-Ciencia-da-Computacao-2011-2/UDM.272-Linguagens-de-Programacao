-- 1. Seja a função funct definida como
-- funct :: Int -> [a] -> [a]
-- funct x xs = take (x+1) xs ++ drop x xs
-- Qual a saída da chamada da função funct 3 [1..7]?

funct :: Int -> [a] -> [a]
funct x xs = (take (x+1) xs) ++ (drop x xs)

main = funct 3 [1..7]