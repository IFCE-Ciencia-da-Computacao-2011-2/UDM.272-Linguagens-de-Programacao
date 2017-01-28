-- 4. Mostre como a compreensão de listas [f x | x <- xs, p x] pode ser definida
-- usando as funções de alta-ordem map e filter.

-- [f x | x <- xs, p x]
-- coisa :: (a -> b) -> [a] -> (a -> Bool) -> [b]                                                                                                                                                                     
coisa f xs p = map f (filter p xs)

-- Exemplo coisa (2*) [1,2,3,4,5] (3>)