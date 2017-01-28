-- 2. Defina uma função recursiva merge :: Ord a => [ a ] -> [ a ] -> [ a ] que
-- junta duas listas ordenadas e retorna uma única lista ordenada. Por exemplo:
-- > merge [2, 5, 6] [1, 3, 4]
-- [1, 2, 3, 4, 5, 6]

merge :: Ord a => [a] -> [a] -> [a]

merge as [] = as
merge [] as = as
merge (x:xs) (y:ys) | x < y = x:merge xs (y:ys)
                    | otherwise = y:merge (x:xs) ys

-- 3. Usando merge, defina uma função recursiva msort :: Ord a => [ a ] -> [ a ]
-- que implementa o merge sort, no qual a lista vazia e a lista unitária já estão ordenadas,
-- e qualquer outra lista é ordenada da seguinte forma: separar a lista em duas metades,
-- ordena as duas metades e depois usa o merge para juntar as duas metades.
-- 
-- baseado em https://gist.github.com/morae/8494016

--takeFirstMiddle :: [a] -> [a]
--takeFirstMiddle xs = take (length xs `div` 2) xs

--takeLastMiddle :: [a] -> [a]
--takeLastMiddle xs = drop (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort xs = merge (msort(takeFirstMiddle xs)) (msort(takeLastMiddle xs))
    where
        takeFirstMiddle xs = take (length xs `div` 2) xs
        takeLastMiddle xs = drop (length xs `div` 2) xs