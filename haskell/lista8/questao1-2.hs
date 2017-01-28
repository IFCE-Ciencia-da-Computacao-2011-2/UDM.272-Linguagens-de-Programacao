-- 1. Considere o seguinte tipo de árvores binárias:
-- type Tree = Leaf | Node Tree Tree.
-- Defina qtdFolhas :: Tree -> Int que retorna o número de folhas em uma árvore

data Tree = Leaf | Node Tree Tree

qtdFolhas :: Tree -> Int

qtdFolhas (Leaf) = 1
qtdFolhas (Node a b) = qtdFolhas a + qtdFolhas b

-- 2. Tal tipo de árvore é balanceada se o número de folhas na sub árvores esquerda e direita
-- de cada nó difere de no máximo um. Defina uma função balanced :: Tree -> Bool
-- que decide se uma árvore é balanceada.

countNodeBalanced (Node a b) = abs (qtdFolhas a - qtdFolhas b) <= 1

balanced :: Tree -> Bool
balanced Leaf = True
balanced (Node a b) = balanced a && balanced b && countNodeBalanced (Node a b)

-- balanced (Node (Node (Node Leaf Leaf) Leaf) Leaf) = False
-- balanced (Node (Node Leaf Leaf) Leaf) = True
-- balanced (Node Leaf Leaf) = True

--balanced Leaf = True
--balanced (Node a b) =
--    if (balanced a && balanced b)
--        then countNodeBalanced (Node a b)
--    else False
