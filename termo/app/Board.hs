module Board where

import System.Console.ANSI (clearScreen)
import LetterStatus (LetterStatus(..))
import Attempt (printStyledLetter, compareLetters)

type Alphabet = [(Char, LetterStatus)]

-- Função para exibir o quadro de tentativas
printBoard :: String -> [String] -> IO ()
printBoard secretWord attempts = do
    clearScreen
    putStrLn "\nQuadro de Tentativas:"
    let maxAttempts = 6
        emptyLine = "_ _ _ _ _"
    mapM_ (\attempt -> processAndPrintAttempt secretWord attempt) attempts
    mapM_ (const $ putStrLn emptyLine) [1..(maxAttempts - length attempts)]

-- Função para processar e exibir uma tentativa
processAndPrintAttempt :: String -> String -> IO ()
processAndPrintAttempt secretWord attempt = do
    let statuses = zipWith (compareLetters secretWord) secretWord attempt
    mapM_ printStyledLetter statuses
    putStrLn ""

-- Função para exibir o status do alfabeto
printAlphabetStatus :: Alphabet -> IO ()
printAlphabetStatus alphabetStatus = do
    let abnt2Order = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    putStrLn "\nLetras Usadas:"
    mapM_ (\line -> do
        mapM_ (\ch -> do
            let status = lookup ch alphabetStatus
            printStyledLetter (ch, maybe Untested id status)
            putStr " ") line
        putStrLn "") abnt2Order
    putStrLn ""

-- Função para atualizar o status do alfabeto
updateAlphabetStatus :: Alphabet -> String -> String -> Alphabet
updateAlphabetStatus alphabet secretWord attempt = map updateLetter alphabet
  where
    statuses = zip attempt (zipWith (compareLetters secretWord) secretWord attempt)

    prioritize :: LetterStatus -> LetterStatus -> LetterStatus
    prioritize oldStatus newStatus
      | oldStatus == RightPlace = RightPlace
      | oldStatus == WrongPlace && newStatus /= RightPlace = WrongPlace
      | otherwise = newStatus

    updateLetter (ch, oldStatus) = case lookup ch statuses of
        Just (_, newStatus) -> (ch, prioritize oldStatus newStatus)
        Nothing -> (ch, oldStatus)
