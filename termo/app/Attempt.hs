module Attempt
    (
        getAttempt,
        isValidAttempt,
        isValidLength,
        wordValidation
    ) where

import Data.Char(toUpper)

import System.IO(openFile, hClose, hIsEOF, hGetContents, Handle, IOMode(..))

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
isValidAttempt attempt = do
    file <- openFile "Words.txt" ReadMode
    content <- hGetContents file
    if elem (map toUpper attempt) (words content)
            then return True
    else return False

-- Verifica se o tamanho da palavra está correto
isValidLength :: String -> Bool
isValidLength str = length str == 5

-- Mostra mensagens de erro
wordValidation :: String -> IO()
wordValidation sword = do
    if not (isValidLength sword) then
        putStrLn "\ESC[31m Erro:\ESC[32m\ESC[0m A palavra deve conter extamente 5 letras."
    else do
        isValid <- isValidAttempt sword;
        if not isValid then
            putStrLn "\ESC[31m Erro:\ESC[32m\ESC[0m Palavra inexistente."
        else 
            return ()

-- TODO: Issue 9
-- Aqui talvez seja melhor passar o data inteiro de gameState e retornar ele modificado (Relacioando com a Issue 2)
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    putStrLn (secretWord ++ " É DIFERENTE DE " ++ attempt)
    return False