-- 6. Utilizando expressões lambda, mostre uma definição para a função abaixo
-- addOneTenPerc :: [(Float,Float)] -> [(Float,Float)]
-- em que a lista resultante é obtida aplicando em cada elemento da lista de entrada a
-- seguinte operação: aumenta em 1 o primeiro elemento da tupla e aumenta em 10% o
-- segunda elemento da tupla.

-- addOneTenPerc = \[] = []

addOneTenPercBase :: (Float, Float) -> (Float,Float)
addOneTenPercBase = \(a, b) -> (a + 1, b * 1.1)

addOneTenPerc :: [(Float,Float)] -> [(Float,Float)]
addOneTenPerc = \xs -> map addOneTenPercBase xs
