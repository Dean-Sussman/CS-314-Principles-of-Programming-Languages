isLocalMax :: [Integer] -> Int -> Bool
isLocalMax xs n =  xs!!n > xs!!(n-1) && xs!!n > xs!!(n+1)



localMaxima :: [Integer] -> [Integer]
localMaxima [] = []
localMaxima xs = filter (/= 0) [if (isLocalMax xs n) == True then xs!!n else 0 | n <- [1..(length xs) - 2]]
