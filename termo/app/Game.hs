module Game where

import Attempt (showAttemptNum, getAttempt, processAttempt)
import Words (getSecretWord)
import Menu (showScore)

-- Definição correta da estrutura LetterStatus
data LetterStatus = Untested | NoExist | WrongPlace | RightPlace
    deriving (Show, Eq)

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
    -- Inicializando o alfabeto
    let alphabet = initAlphabet
    let initialGameState = GameState
            { secretWord = secret
            , numAttemptsLeft = 6
            , attempts = []        -- Nenhuma tentativa foi feita ainda
            }

    -- Obtendo a palavra secreta
    secretWord <- getSecretWord
    let maxAttempts = 6

    -- Iniciando o loop do jogo
    loopGame secretWord maxAttempts

-- Loop principal do jogo
loopGame :: String -> Int -> IO ()
loopGame secretWord attemptNum = do
    -- Limpando a tela (opcional)
    -- putStrLn "\ESC[2J"

    -- Exibindo tentativas restantes
    showAttemptNum attemptNum

    -- Recebendo a tentativa do jogador
    attempt <- getAttempt

    -- Processando a tentativa
    rightAns <- processAttempt secretWord attempt

    -- Verificando o estado do jogo
    if rightAns then do
        showScore secretWord attemptNum
        return ()
    else do
        let newAttemptNum = attemptNum - 1
        if newAttemptNum <= 0 then do
            showScore secretWord attemptNum
            return ()
        else loopGame secretWord newAttemptNum
