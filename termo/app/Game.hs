module Game where

import Attempt (showAttemptNum, getAttempt, processAttempt)
import Words (getSecretWord)
import Menu (showScore)


runGame :: IO ()
runGame = do
    -- Variáveis globais do jogo
    -- TODO: Issue 2
    secretWord <- getSecretWord
    let maxAttempts = 6

    -- Loop do jogo
    loopGame secretWord maxAttempts



loopGame :: String -> Int -> IO ()
loopGame secretWord attemptNum = do
    -- Limpando tela
    putStrLn "\ESC[2J"

    -- Exibindo tentativas restantes na tela
    showAttemptNum attemptNum

    -- Recebendo input do jogador
    attempt <- getAttempt

    -- Processando tentativa
    rightAns <- processAttempt secretWord attempt

    -- Verificando se o jogo acabou
    if rightAns then do
        showScore secretWord attemptNum
        return ()
    else do
        let newAttemptNum = attemptNum - 1
        if newAttemptNum <= 0 then do
            showScore secretWord attemptNum
            return ()
        else loopGame secretWord newAttemptNum