-- 3. Considere o problema de codificação de uma string a fim de disfarçar o seu conteúdo
-- de leitores indesejados. Um método de codificação bem conhecido é a cifra de César,
-- em homenagem a sua utilização por Júlio César. Para codificar uma string, César
-- simplesmente substituía cada letra pela letra três lugares depois no alfabeto. Por
-- exemplo, a string "haskell is fun" é codificada como "kdvnhoo lv ixq".
-- De modo mais geral, o fator de desvio de três usado por César pode ser substituído por
-- qualquer número inteiro entre um e vinte e cinco, dando assim vinte e cinco maneiras
-- diferentes de codificar uma string. Por exemplo, com um fator de desvio de dez, a
-- string original acima poderia ser codificada como "rkcuovv sc pex". Implemente a
-- cifra de César para strings de caracteres minusculas seguindo os passos a seguir:
-- Usando import Data.Char e as funções ord :: Char -> Int e chr :: Int - Char,
-- defina uma função
-- let2int :: Char -> Int
-- que converte uma letra minúscula entre 'a' e 'z' para o inteiro correspondente entre 0 e 25,
-- e também uma função
-- int2let :: Int -> Char
-- que realiza a conversão oposta. Por exemplo,
-- > let2int 'a'
-- 0
-- > int2let 0
-- 'a'
-- Usando essas duas funções, defina uma função
-- shift :: Int -> Char -> Char
-- que aplica o fator de deslocamento para uma letra minúscula. Por exemplo,
-- > shift 3 'a'
-- 'd'
-- Usando shift, defina uma função
-- encode :: Int -> String -> String
-- que codifica uma string usando um determinado fator de deslocamento e também uma função
-- decode :: Int -> String -> String
-- que decodifica a string.

import Data.Char
--ord :: Char -> Int
--chr :: Int - Char

let2int :: Char -> Int
let2int char = ord(char) - 97

int2let :: Int -> Char
int2let number = chr(number + 97)

shift :: Int -> Char -> Char
--shift number = 
--    \char ->
--        if let2int(char) + number > let2int('z')
--            then int2let(let2int(char) + number - let2int('z') - 1)
--        else if let2int(char) + number < let2int('a')
--            then int2let(let2int(char) + number + let2int('a'))
--        else int2let(let2int(char) + number)

shift number char | let2int(char) + number > let2int('z') = int2let(let2int(char) + number - let2int('z') - 1)
                  | let2int(char) + number < let2int('a') = int2let(let2int(char) + number + let2int('a'))
                  | otherwise = int2let(let2int(char) + number)

encode :: Int -> String -> String
encode number phrase = map (shift number) phrase

decode :: Int -> String -> String
decode number phrase = map (shift(-1*number)) phrase
