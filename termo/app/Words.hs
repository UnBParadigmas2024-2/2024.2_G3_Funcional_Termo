module Words (loadWords, getSecretWord) where

import System.Random (randomRIO)

-- Função para carregar as palavras de um arquivo
loadWords :: FilePath -> IO [String]
loadWords filename = do
    contents <- readFile filename
    return (lines contents)

-- Função para obter uma palavra secreta aleatória
getSecretWord :: IO String
getSecretWord = do
    words <- loadWords "Words.txt"
    index <- randomRIO (0, length words - 1)
    return (words !! index)

