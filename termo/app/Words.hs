module Words (loadWords, getSecretWord) where

import System.Random (randomRIO)

-- Função para carregar as palavras de um arquivo
loadWords :: FilePath -> IO [String]
loadWords filename = do
    contents <- readFile filename
    return (lines contents)

