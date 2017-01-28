-- 3. Na lógica proposicional temos fórmulas que são construídas a partir de símbolos
-- atômicos como p, q e r e conectivos lógicos ∧, ∨, → e ¬. Um tipo para fórmulas da
-- lógica proposicional pode ser definido da seguinte forma:
-- data Form = Atom Char | And Form Form | Or Form Form
-- | Imply Form Form | Not Form.
-- Por exemplo, a fórmula (p ∧ q) → ¬r pode ser representada como
-- ((Atom 'p') 'And' (Atom 'q')) 'Imply' (Not (Atom 'r')).
-- Para atribuir um valor-verdade para uma fórmula precisamos saber o valor de cada
-- atômica. Para isso, vamos definir o tipo type Val = [(Char,Bool)]. Defina uma
-- função val :: Val -> Form -> Bool que retorna o valor-verdade de uma fórmula.
--Por exemplo:
-- > val [('p',True),('q',False)] ((Atom 'p') 'And' (Not (Atom 'q')))
-- True


data Form = Atom Char | And Form Form | Or Form Form | Imply Form Form | Not Form
type Val = [(Char,Bool)]

valueOf :: Val -> Char -> Bool
valueOf values key = head [value | (key2, value) <- values, key2 == key]

val :: Val -> Form -> Bool
val values (Atom char) = valueOf values char
val values (Not form) = not (val values form)
val values (And a b) = (val values a) && (val values b)
val values (Or a b) = (val values a) || (val values b)

-- val [('p',True),('q',False)] ((Atom 'p') `And` (Not (Atom 'q')))

-- 4. Defina uma função atomics :: Form -> [Char] que retorna a lista de todas as
-- atômicas de uma fórmula. Por exemplo:
-- > atomics (((Atom 'p') `And` (Atom 'q')) `Imply` (Not (Atom 'r')))
-- [‘p’,‘q’,‘r’]

atomics :: Form -> [Char]
atomics (Atom char) = [char]
atomics (Not a) = atomics a
atomics (a `And` b) = atomics a ++ atomics b
atomics (a `Or` b) = atomics a ++ atomics b
atomics (a `Imply` b) = atomics a ++ atomics b
