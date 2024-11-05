module Main where

import Game (runGame)

main :: IO ()
main = do
    -- Limpando tela
    putStrLn "\ESC[2J"

    putStrLn "████████╗ ███████╗ ██████╗░ ███╗░░░███╗ ░█████╗░"
    putStrLn "╚══██╔══╝ ██╔════╝ ██╔══██╗ ████╗░████║ ██╔══██╗"
    putStrLn "░░░██║░░░ █████╗░░ ██████╔╝ ██╔████╔██║ ██║░░██║"
    putStrLn "░░░██║░░░ ██╔══╝░░ ██╔══██╗ ██║╚██╔╝██║ ██║░░██║"
    putStrLn "░░░██║░░░ ███████╗ ██║░░██║ ██║░╚═╝░██║ ╚█████╔╝"
    putStrLn "░░░╚═╝░░░ ╚══════╝ ╚═╝░░╚═╝ ╚═╝░░░░░╚═╝ ░╚════╝░"

    showMenu

showMenu :: IO ()
showMenu = do
    putStrLn ""
    putStrLn "════════════════════════════════════════════════"
    putStrLn ""

    putStrLn "Escolha uma opção:"
    putStrLn "1. Jogar"
    putStrLn "2. Ver as regras"
    putStrLn ""

    input <- getLine
    if input == "i" then
        putStrLn "Hello, Haskell!"
    else if input == "p" then
        runGame
    else
        putStrLn "Entrada inválida. Por favor, digite 'i' ou 'p'."