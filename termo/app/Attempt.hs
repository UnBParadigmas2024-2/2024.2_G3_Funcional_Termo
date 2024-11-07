module Attempt
    (
        getAttempt,
        isValidAttempt
    ) where

import System.IO(openFile, hClose, hIsEOF, hGetLine, Handle, IOMode(..))

-- TODO: Issue 5
showAttemptNum :: Int -> IO ()
showAttemptNum attemptNum = do
    putStrLn ("Tentativa " ++ show attemptNum)



-- TODO: Issue 7
getAttempt :: IO String
getAttempt = do
    line <- getLine
    return line

-- Verifica se a palavra de entrada existe no banco de palavras
isValidAttempt :: String -> IO Bool
isValidAttempt sword = do
    file <- openFile "Words.txt" ReadMode
    result <- readLines file
    hClose file
    return result
 where
    readLines :: Handle -> IO Bool
    readLines file = do
        eof <- hIsEOF file
        if eof
            then return False
        else do    
            line <- hGetLine file
            if elem sword (words line)
                then return True
            else readLines file

-- TODO: Issue 9
-- Aqui talvez seja melhor passar o data inteiro de gameState e retornar ele modificado (Relacioando com a Issue 2)
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    putStrLn (secretWord ++ " É DIFERENTE DE " ++ attempt)
    return False