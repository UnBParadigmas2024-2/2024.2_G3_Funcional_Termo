module Attempt
    (
        getAttempt,
        isValidAttempt,
        isValidLength,
        wordValidation
    ) where

import System.IO(openFile, hClose, hIsEOF, hGetContents, Handle, IOMode(..))
import Data.Char(toUpper, toLower)
import Colors (red, reset)  -- Importa as variáveis red e reset de colors


-- Função para verificar a presença de uma letra e sua posição na palavra secreta
containsElem :: Char -> String -> (Int, Int)
containsElem c str = containsElemAux c str 0

containsElemAux :: Char -> String -> Int -> (Int, Int)
containsElemAux _ [] _ = (0, -1)  -- Retorna -1 se o caractere não está presente
containsElemAux c (x:xs) index
    | c == x    = (1, index)
    | otherwise = containsElemAux c xs (index + 1)

-- Função que constrói o feedback de acordo com as regras especificadas
buildFeedback :: String -> String -> String
buildFeedback secretWord attempt = [feedbackChar i | i <- [0 .. length attempt - 1]]
  where
    feedbackChar i =
      let c = attempt !! i
      in if i < length secretWord && c == secretWord !! i
         then '^'                       -- Letra está na posição correta
         else let (found, _) = containsElem c secretWord
              in if found == 1 then '>'  -- Letra está na palavra, mas em posição errada
                 else 'x'                -- Letra não está na palavra secreta

-- TODO: Issue 5
showAttemptNum :: Int -> IO ()
showAttemptNum attemptNum = do
    putStrLn ("")
    putStrLn ("Tentativas restantes: " ++ red ++ show attemptNum ++ reset)
    putStrLn ("")


-- TODO: Issue 7
getAttempt :: IO String
getAttempt = do
    line <- getLine
    return (map toLower line)  -- Converte a entrada do usuário para minúsculas

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
-- Função que processa a tentativa e gera o feedback
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    let lowercaseSecret = map toLower secretWord   -- Converte a palavra secreta para minúsculas
        lowercaseAttempt = map toLower attempt      -- Converte a tentativa para minúsculas
        feedback = buildFeedback lowercaseSecret lowercaseAttempt
    putStrLn feedback
    return (lowercaseSecret == lowercaseAttempt)  -- Retorna True se a tentativa for igual à palavra secreta
