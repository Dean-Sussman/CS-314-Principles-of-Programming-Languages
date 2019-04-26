import Data.List

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
