-- 6. Uma empresa tem várias filiais e quer saber o gasto total com o salário dos funcionários.
-- Defina uma função gastoEmpresa :: [[Float]] -> Float em que cada
-- sublista representar a lista de salários de uma filial e retorna o gasto total com
-- os salário.

gastoEmpresaFilial :: [Float] -> Float
gastoEmpresaFilial = foldr (+) 0
--gastoEmpresaFilial = sum

gastoEmpresa :: [[Float]] -> Float
-- Modo 1
--gastoEmpresa xss = sum (map gastoEmpresaFilial xss)
-- Modo 1.1
gastoEmpresa = sum . map gastoEmpresaFilial
-- Modo 2
--gastoEmpresa xss = sum [gastoEmpresaFilial gastoFilial | gastoFilial <- xss]
-- Modo 3 
--gastoEmpresa [] = 0
--gastoEmpresa (gastoFilial:gastoss) = (gastoEmpresaFilial gastoFilial) + (gastoEmpresa gastoss)

-- Testar
-- gastoEmpresa [[100, 200], [400, 200, 100]] == 1000.0

-- Em seguida, a empresa quer dar uma aumento de 10% para os funcionários
-- que ganham menos de R$1000,00 e um aumento de 5% para o restante. Faça
-- uma função aumentarSal :: [[Float]] -> [[Float]] para realizar essa operação.

aumentarSalario salario
    | salario < 1000 = salario * 1.1
    | otherwise = salario * 1.05

aumentarSal :: [[Float]] -> [[Float]]
--aumentarSal salarioss = map (map aumentarSalario) salarioss
aumentarSal = map (map aumentarSalario)

-- Testar
-- aumentarSal [[100, 200], [400, 200, 100, 1000]]

-- Para finalizar, a empresa gostaria de saber qual vai ser o novo gasto com os salários
-- depois do aumento. Para isso, defina a função novoGasto :: [[Float]] -> Float
-- usando composição de funções.

novoGasto :: [[Float]] -> Float
novoGasto = \salarioss -> gastoEmpresa (aumentarSal salarioss) - gastoEmpresa salarioss
-- Ou
--novoGasto salarioss = gastoEmpresa (aumentarSal salarioss) - gastoEmpresa salarioss

-- novoGasto [[100, 200], [400, 200, 100, 1000]]
