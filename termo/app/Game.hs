module Game where

import LetterStatus (LetterStatus(..))
import Words (getSecretWord)
import Attempt (showAttemptNum, getAttempt, getUppercaseInput, processAttempt)
import Words (getSecretWord)
import Menu (showScore)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))

runGame :: IO ()
runGame = do
    secretWord <- getSecretWord
    let maxAttempts = 6
    loopGame secretWord maxAttempts

loopGame :: String -> Int -> IO ()
loopGame secretWord attemptNum = do
    showAttemptNum attemptNum
    attempt <- getUppercaseInput
    processAttempt secretWord attempt

    if attempt == secretWord then do
        showScore secretWord attemptNum
        return ()
    else do
        let newAttemptNum = attemptNum - 1
        if newAttemptNum <= 0 then do
            showScore secretWord 0 
            return ()
        else loopGame secretWord newAttemptNum
