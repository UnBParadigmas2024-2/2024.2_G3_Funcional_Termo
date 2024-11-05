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

        putStrLn ""
    putStrLn "════════════════════════════════════════════════"
    putStrLn ""

showMenu


showMenu :: IO ()
showMenu = do
    putStrLn "Escolha uma opção:"
    putStrLn "1. Jogar"
    putStrLn "2. Ver as regras"
    
    input <- getLine
    if input == "1" then
        runGame
    else if input == "2" then do
      showRules
      showMenu
    else do
        putStrLn "Entrada inválida. Por favor, digite '1' ou '2'."
      putStrLn ""
      showMenu


showRules :: IO ()
showRules = do
    putStrLn "Placeholder"
    putStrLn ""