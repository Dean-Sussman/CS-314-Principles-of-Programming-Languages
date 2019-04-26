import Data.List

replace :: Eq a => a -> a -> [a] -> [a]
replace a b = map $ \c -> if c == a then b else c

numRepeats :: Eq a => a -> [a] -> Int --counts how many times input 1 appears in the input list
numRepeats x = length.filter(==x)


--takes a list of things to check for, and the list to be checked. returns a list tallying how many of each thing were found
counts :: Eq a => [a] -> [a] -> [Int]
counts ys xs = map (flip numRepeats xs) ys


histogram :: [Integer] -> String
histogram xs = (intercalate "\n" (reverse(transpose(replace "" " " (map(flip replicate '*') (counts [0..9] xs)))))) ++ "\n==========\n0123456789\n"
