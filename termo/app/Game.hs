module Game where

import LetterStatus (LetterStatus(..))
import Words (getSecretWord)
import Attempt (showAttemptNum, getUppercaseInput, processAttempt)
import Menu (showScore)
import Board (printBoard, printAlphabetStatus, updateAlphabetStatus, processAndPrintAttempt)

-- Tipo e inicialização do alfabeto
type Alphabet = [(Char, LetterStatus)]

initAlphabet :: Alphabet
initAlphabet = [(c, Untested) | c <- ['A'..'Z']]

-- Estrutura de dados para guardar o estado do jogo
data GameState = GameState
    { secretWord :: String          -- Palavra secreta
    , numAttemptsLeft :: Int        -- Número de tentativas restantes
    , attempts :: [String]          -- Lista de tentativas feitas pelo jogador
    , alphabetStatus :: Alphabet    -- Status das letras do alfabeto
    , attemptNum :: Int             -- Número da tentativa atual
    } deriving (Show)

-- Função principal do jogo
runGame :: IO ()
runGame = do
    secret <- getSecretWord
    let initialGameState = GameState
            { secretWord = secret
            , numAttemptsLeft = 6
            , attempts = []
            , alphabetStatus = initAlphabet
            , attemptNum = 1
            }
    loopGame initialGameState

-- Loop principal do jogo
loopGame :: GameState -> IO ()
loopGame gameState = do
    let attemptsLeft = numAttemptsLeft gameState
        secret = secretWord gameState
        previousAttempts = attempts gameState
        alphabetStatusList = alphabetStatus gameState
        currentAttemptNum = attemptNum gameState

    -- Exibindo o quadro de tentativas e o status do alfabeto
    printBoard secret previousAttempts
    printAlphabetStatus alphabetStatusList
    showAttemptNum (7 - currentAttemptNum)

    -- Recebendo a tentativa do jogador
    attempt <- getUppercaseInput

    -- Processando a tentativa
    processAttempt secret attempt

    -- Atualizando o estado do alfabeto e das tentativas
    let newAttempts = previousAttempts ++ [attempt]
        newAlphabetStatus = updateAlphabetStatus alphabetStatusList secret attempt

    -- Verificando se a tentativa é correta
    if attempt == secret then do
        printBoard secret newAttempts
        printAlphabetStatus newAlphabetStatus
        showScore secret attemptsLeft
        return ()
    else do
        -- Atualizando o estado do jogo com uma tentativa a menos
        let updatedGameState = gameState
                { numAttemptsLeft = attemptsLeft - 1
                , attempts = newAttempts
                , alphabetStatus = newAlphabetStatus
                , attemptNum = currentAttemptNum + 1
                }

        -- Verificando se ainda há tentativas restantes
        if numAttemptsLeft updatedGameState <= 0 then do
            printBoard secret newAttempts
            printAlphabetStatus newAlphabetStatus
            showScore secret 0
        else loopGame updatedGameState
