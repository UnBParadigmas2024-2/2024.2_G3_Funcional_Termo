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
    putStrLn "3. Sair"
    putStrLn ""

    input <- getLine
    handleInput input

handleInput :: String -> IO ()
handleInput input
    | input == "1" = runGame
    | input == "2" = do
        showRules
        showMenu
    | input == "3" = putStrLn "Saindo do jogo. Te vejo na próxima!"
    | otherwise = do
        putStrLn ""
        putStrLn "Entrada inválida. Por favor, digite '1' ou '2'."
        putStrLn ""
        showMenu

showRules :: IO ()
showRules = do
  putStrLn ""
  putStrLn "Placeholder"
  putStrLn ""
