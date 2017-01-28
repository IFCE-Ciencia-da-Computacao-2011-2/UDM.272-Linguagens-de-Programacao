-- 2. Mostre uma definiçãoo para a função
-- remove :: Int -> [a] -> [a]
-- que recebe um número n e uma lista e remove o elemento da posição n da lista.

remove :: Int -> [a] -> [a]
remove x xs = (take x xs) ++ (drop (x+1) xs)