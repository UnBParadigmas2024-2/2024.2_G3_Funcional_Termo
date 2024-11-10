module Attempt where

import Data.Char (toLower, toUpper)
import Colors (red, reset)  -- Importa as variáveis red e reset de colors
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
    putStr [ch]
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

getUppercaseInput :: IO String
getUppercaseInput = do
    line <- getLine
    return (map toUpper line)

-- TODO: Issue 9
-- Função que processa a tentativa e gera o feedback
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    let lowercaseSecret = map toLower secretWord   -- Converte a palavra secreta para minúsculas
        lowercaseAttempt = map toLower attempt      -- Converte a tentativa para minúsculas
        statuses = zipWith (compareLetters lowercaseSecret) lowercaseSecret lowercaseAttempt
    mapM_ printStyledLetter statuses                -- Imprime cada letra com o status colorido
    putStrLn ""
    return (lowercaseSecret == lowercaseAttempt)