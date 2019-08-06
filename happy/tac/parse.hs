module Main where
import Tac
import Tokens

main :: IO () 
main = do
        s <- getContents
        putStr $ parse $ scanTokens s
