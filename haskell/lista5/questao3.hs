-- 3. Qual o tipo da definição abaixo?
-- palindrome xs = reverse xs == xs

palindrome xs = reverse xs == xs

-- R: palindrome :: [a] -> Bool
-- R correta: palindrome :: Eq a => [a] -> Bool 
