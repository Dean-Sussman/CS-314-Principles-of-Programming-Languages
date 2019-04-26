import Data.List

--begin HOPSCOTCH code
--creates a list of every nth element
everyNth :: [a] -> Int -> [a]
everyNth [] _ = [] --empty list and any number returns empty list
everyNth as 0 = [] --any list and 0 returns the list; maybe try (..0) or something to catch negative cases
everyNth (as) (n) = drop (n-1) (take n as) ++  everyNth (drop n as) n

--drop (n-1) (take n as)
--takes the first n elements of a list, then drops the first n-1 elements from that list
--essentially grabs the nth element of the list

-- ++ appends the result of drop to the result of everyNth

-- everyNth (drop n as) n
-- runs the function on the rest of the list; when n is 1 and input is "hello", the next iteration is on "ello"; when n is 2, the next would be "llo"

--function as a whole: takes the nth element from the list, then reduces the list by n, then does it again, until only the empty list remains

skips :: [a] -> [[a]]
skips as = [ everyNth as n | n <- [1..length as] ]
--driver function, essentially
--makes a list of lists, built from the everyNth function
--runs everyNth on (the list, n), from n = 1 to the length of the input 

--end HOPSCOTCH code


--begin LOCALMAXIMA code
isLocalMax :: [Integer] -> Int -> Bool
isLocalMax xs n =  xs!!n > xs!!(n-1) && xs!!n > xs!!(n+1)
--checks to see if a given element is a local max by comparing it to the elements immediately before and after it


localMaxima :: [Integer] -> [Integer]
localMaxima [] = []
localMaxima xs = filter (/= 0) [if (isLocalMax xs n) == True then xs!!n else 0 | n <- [1..(length xs) - 2]]
--end LOCALMAXIMA code



--begin HISTOGRAM code
replace :: Eq a => a -> a -> [a] -> [a]
replace a b = map $ \c -> if c == a then b else c

numRepeats :: Eq a => a -> [a] -> Int --counts how many times input 1 appears in the input list
numRepeats x = length.filter(==x)


--takes a list of things to check for, and the list to be checked. returns a list tallying how many of each thing were found
counts :: Eq a => [a] -> [a] -> [Int]
counts ys xs = map (flip numRepeats xs) ys

numListToStars :: [Integer] -> [String]
--numListToStars xs = map(flip replicate '*' ++ flip replicate (maximum xs - x) ' ') (counts [0..9] xs)
numListToStars xs = map(\x -> replicate x '*' ++ replicate(maximum(counts [0..9] xs) - x) ' ') (counts [0..9] xs)

histogram :: [Integer] -> String
histogram xs = (intercalate "\n" (reverse(transpose((numListToStars xs))))) ++ "\n==========\n0123456789\n"
--end HISTOGRAM code
