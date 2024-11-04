module Main where

import Game (runGame)

main :: IO ()
main = do
    -- Limpando tela
    putStrLn "\ESC[2J"

    putStrLn "Digite 'i' para imprimir 'Hello, Haskell!' ou 'p' para jogar Termo:"
    input <- getLine
    if input == "i" then
        putStrLn "Hello, Haskell!"
    else if input == "p" then
        runGame
    else
        putStrLn "Entrada inválida. Por favor, digite 'i' ou 'p'."