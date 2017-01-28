-- 5. Defina a função flat :: [[a]] -> [a] usando foldr. (ver questão 1)

flat :: [[a]] -> [a]
flat = foldr (++) []