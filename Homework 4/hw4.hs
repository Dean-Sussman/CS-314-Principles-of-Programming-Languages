import System.Random
import System.IO
import Control.Monad 
import Data.List
import Data.Char


--getChar was reading the user input char and '\n', making the program do two prints in a row instead of one
myGetChar :: IO Char
myGetChar = do
 line <- getLine
 case line of
  [] -> myGetChar
  (c:_) -> return c

currentState :: String -> String
currentState word = [if c `elem` ['A' .. 'Z'] then c else '_' | c <- word]

getRand :: IO Int
getRand = getStdRandom (randomR (0,45406))

tryGuess :: String -> Char -> IO()
tryGuess word guess
 | guess `elem` word = play [if guess == c then toUpper guess else c | c <- word]
 | otherwise = play word

play :: String -> IO()
play word
 | word == map toUpper word = do
    putStrLn (map toLower(currentState word))
 | otherwise = do
    putStrLn (map toLower(currentState word))
    guess <- myGetChar
    tryGuess word guess
 

main :: IO()
main = do
 wordList <- readFile "words.txt"
 let someWords = lines wordList
 int <- getRand--used to get random word from file
 putStrLn (map toLower(currentState(someWords!!int)))
 c <- myGetChar
 tryGuess (someWords!!int) c
