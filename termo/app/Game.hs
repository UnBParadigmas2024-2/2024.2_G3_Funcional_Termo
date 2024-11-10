module Game where

import LetterStatus (LetterStatus(..))
import Words (getSecretWord)
import Attempt (showAttemptNum, getUppercaseInput, processAttempt)
import Menu (showScore)
import System.Console.ANSI (setSGR, SGR(SetColor, Reset), ColorIntensity(Vivid), Color(..), ConsoleLayer(Foreground))

-- Tipo e inicialização do alfabeto
type Alphabet = [(Char, LetterStatus)]

initAlphabet :: Alphabet
initAlphabet = [(c, Untested) | c <- ['a'..'z']]

-- Estrutura de dados para guardar o estado do jogo
data GameState = GameState
    { secretWord :: String           -- Palavra secreta
    , numAttemptsLeft :: Int         -- Número de tentativas restantes
    , attempts :: [String]           -- Lista de tentativas feitas pelo jogador
    } deriving (Show)

-- Função principal do jogo
runGame :: IO ()
runGame = do
    -- Obtendo a palavra secreta
    secret <- getSecretWord

    -- Inicializando o estado do jogo
    let initialGameState = GameState
            { secretWord = secret
            , numAttemptsLeft = 6
            , attempts = []        -- Nenhuma tentativa foi feita ainda
            }

    -- Iniciando o loop do jogo com o estado inicial
    loopGame initialGameState

-- Loop principal do jogo
loopGame :: GameState -> IO ()
loopGame gameState = do
    let attemptsLeft = numAttemptsLeft gameState
        secret = secretWord gameState
        previousAttempts = attempts gameState

    -- Exibindo tentativas restantes
    showAttemptNum attemptsLeft

    -- Recebendo a tentativa do jogador
    attempt <- getUppercaseInput

    -- Processando a tentativa
    processAttempt secret attempt

    -- Atualizando o estado do jogo
    let updatedGameState = gameState
            { numAttemptsLeft = attemptsLeft - 1
            , attempts = previousAttempts ++ [attempt]
            }

    -- Verificando o estado do jogo
    if attempt == secret then do
        showScore secret attemptsLeft
        return ()
    else if numAttemptsLeft updatedGameState <= 0 then do
        showScore secret 0
        return ()
    else loopGame updatedGameState
