module Main where
import BitsParser

main :: IO () 
main = do
        s <- getContents
        print $ parse s
