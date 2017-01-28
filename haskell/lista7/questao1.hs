-- 1. Defina uma função recursiva flat :: [[a]] -> [a] que recebe uma lista de listas
-- e retorna a lista de todos os elementos das sublistas. Por exemplo:
-- > flat [[1,2],[4,2,1]]
-- [1,2,4,2,1]

flat :: [[a]] -> [a]

flat [] = []
flat (x:xs) = x ++ flat xs