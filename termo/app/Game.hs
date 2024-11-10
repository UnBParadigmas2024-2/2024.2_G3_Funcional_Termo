module Game where

import LetterStatus (LetterStatus(..))
import Words (getSecretWord)
import Attempt (showAttemptNum, getAttempt, getUppercaseInput, processAttempt)
import Words (getSecretWord)
import Menu (showScore)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))

statusToColor :: LetterStatus -> Color
statusToColor NoExist = Black
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
    showAttemptNum attemptNum
    attempt <- getUppercaseInput
    processAndPrintAttempt secretWord attempt

    if attempt == secretWord then do
        showScore secretWord attemptNum
        return ()
    else do
        let newAttemptNum = attemptNum - 1
        if newAttemptNum <= 0 then do
            showScore secretWord attemptNum
            return ()
        else loopGame secretWord newAttemptNum
