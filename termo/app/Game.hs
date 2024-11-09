module Game where

import LetterStatus (LetterStatus(..))
import Words (getSecretWord)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))

statusToColor :: LetterStatus -> Color
statusToColor NoExist = Red
statusToColor RightPlace = Green
statusToColor WrongPlace = Yellow
statusToColor _ = White 

printStyledLetter :: (Char, LetterStatus) -> IO ()
printStyledLetter (ch, status) = do
    setSGR [SetColor Foreground Vivid (statusToColor status)]
    putStr [ch]
    setSGR [Reset]

processAndPrintAttempt :: String -> String -> IO ()
processAndPrintAttempt secretWord attempt = do
    let statuses = zipWith (compareLetters secretWord) secretWord attempt
    mapM_ printStyledLetter statuses
    putStrLn ""

compareLetters :: String -> Char -> Char -> (Char, LetterStatus)
compareLetters secretWord secretLetter attemptLetter
    | attemptLetter == secretLetter = (attemptLetter, RightPlace)
    | attemptLetter `elem` secretWord = (attemptLetter, WrongPlace)
    | otherwise = (attemptLetter, NoExist)

runGame :: IO ()
runGame = do
    secretWord <- getSecretWord
    let maxAttempts = 6
    loopGame secretWord maxAttempts

loopGame :: String -> Int -> IO ()
loopGame secretWord attemptNum = do
    putStrLn ("Tentativa " ++ show attemptNum ++ ":")
    attempt <- getLine
    processAndPrintAttempt secretWord attempt

    if attempt == secretWord then do
        putStrLn "\nVocê acertou! Parabéns!"
        return ()
    else do
        let newAttemptNum = attemptNum - 1
        if newAttemptNum <= 0 then do
            putStrLn "\nVocê não acertou. Fim de jogo!"
            return ()
        else loopGame secretWord newAttemptNum
