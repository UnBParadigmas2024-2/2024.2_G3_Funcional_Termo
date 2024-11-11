module Attempt where

import Data.Char (toLower, toUpper)
import Colors (red, reset)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))
import LetterStatus (LetterStatus(..))

-- ------------------------------------- Processamento de letras -------------------------------------
-- Função que mapeia uma cor pra cada status
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


-- Função que processa a tentativa e gera o feedback
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    let lowercaseSecret = map toLower secretWord   -- Converte a palavra secreta para minúsculas
        lowercaseAttempt = map toLower attempt      -- Converte a tentativa para minúsculas
        statuses = zipWith (compareLetters lowercaseSecret) lowercaseSecret lowercaseAttempt
    mapM_ printStyledLetter statuses                -- Imprime cada letra com o status colorido
    putStrLn ""
    return (lowercaseSecret == lowercaseAttempt)


-- ------------------------------------- Exibindo Tentativas -------------------------------------
-- Função para obter a tentativa do jogador
showAttemptNum :: Int -> IO ()
showAttemptNum attemptNum = do
    putStrLn ("")
    putStrLn ("Tentativas restantes: " ++ red ++ show attemptNum ++ reset)
    putStrLn ("")


-- ------------------------------------- Validação de Input -------------------------------------
-- Função para carregar as palavras do arquivo
loadWords :: FilePath -> IO [String]
loadWords filePath = do
    content <- readFile filePath
    return (map (map toUpper) (lines content))

-- Função principal que valida e retorna a tentativa em maiúsculas
getUppercaseInput :: IO String
getUppercaseInput = do
    attempt <- getLine
    validWords <- loadWords "Words.txt"
    let attemptUpper = map toUpper attempt
    if isValidLength attemptUpper && attemptUpper `elem` validWords
        then return attemptUpper
        else do
            putStrLn "Erro: Palavra deve ter 5 letras e estar no banco de palavras."
            getUppercaseInput  -- Pede nova entrada recursivamente

-- Verifica se o tamanho da palavra está correto
isValidLength :: String -> Bool
isValidLength str = length str == 5
