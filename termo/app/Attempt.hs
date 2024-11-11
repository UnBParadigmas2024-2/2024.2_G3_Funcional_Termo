module Attempt
    (
        getAttempt,
        isValidAttempt,
        isValidLength,
        wordValidation,
        validateInput
    ) where

import System.IO(openFile, hClose, hIsEOF, hGetContents, Handle, IOMode(..))
import Data.Char(toUpper, toLower)
import Colors (red, reset)  -- Importa as variáveis red e reset de colors

import Data.Char (toLower, toUpper)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))
import LetterStatus (LetterStatus(..))

statusToColor :: LetterStatus -> Color
statusToColor NoExist = Black
statusToColor RightPlace = Green
statusToColor WrongPlace = Yellow
statusToColor _ = White 

-- Função que imprime a letra com a cor correspondente
printStyledLetter :: (Char, LetterStatus) -> IO ()
printStyledLetter (ch, status) = do
    setSGR [SetColor Foreground Vivid (statusToColor status)]
    putStr [ch, ' ']
    setSGR [Reset]

-- Função que compara as letras e retorna o status
compareLetters :: String -> Char -> Char -> (Char, LetterStatus)
compareLetters secretWord secretLetter attemptLetter
    | attemptLetter == secretLetter = (attemptLetter, RightPlace)
    | attemptLetter `elem` secretWord = (attemptLetter, WrongPlace)
    | otherwise = (attemptLetter, NoExist)


-- Função para verificar a presença de uma letra e sua posição na palavra secreta
containsElem :: Char -> String -> (Int, Int)
containsElem c str = containsElemAux c str 0

containsElemAux :: Char -> String -> Int -> (Int, Int)
containsElemAux _ [] _ = (0, -1)  -- Retorna -1 se o caractere não está presente
containsElemAux c (x:xs) index
    | c == x    = (1, index)
    | otherwise = containsElemAux c xs (index + 1)

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
    return (map toUpper line)

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
wordValidation :: String -> IO Bool
wordValidation sword = do
    if not (isValidLength sword) then do
        putStrLn "\ESC[31m Erro:\ESC[32m\ESC[0m A palavra deve conter exatamente 5 letras."
        return False
    else do
        isValid <- isValidAttempt sword
        if not isValid then do
            putStrLn "\ESC[31m Erro:\ESC[32m\ESC[0m Palavra inexistente."
            return False
        else return True

-- Validação geral da palavra
validateInput :: IO String
validateInput = do
    word <- getAttempt
    isValid <- wordValidation word
    if isValid
        then return word
        else do
            putStrLn "Tente novamente."
            validateInput


-- Função que processa a tentativa e gera o feedback
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    let lowercaseSecret = map toLower secretWord   -- Converte a palavra secreta para minúsculas
        lowercaseAttempt = map toLower attempt      -- Converte a tentativa para minúsculas
        statuses = zipWith (compareLetters lowercaseSecret) lowercaseSecret lowercaseAttempt
    mapM_ printStyledLetter statuses                -- Imprime cada letra com o status colorido
    putStrLn ""
    return (lowercaseSecret == lowercaseAttempt)