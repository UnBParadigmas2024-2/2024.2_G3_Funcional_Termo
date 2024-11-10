module Main where

import System.Console.ANSI (setSGR, Color(..), ColorIntensity(..), ConsoleLayer(..), SGR(..))
import Game (runGame)
import Colors (green, yellow, red, reset) -- Importa as cores utilizadas no showRules


main :: IO ()
main = do
    -- Limpando tela
    putStrLn "\ESC[2J"

-- Exibindo o título em cores
    putStrLn $ purple ++ "████████╗ ███████╗ ██████╗░ ███╗░░░███╗ ░█████╗░"
    putStrLn $ "╚══██╔══╝ ██╔════╝ ██╔══██╗ ████╗░████║ ██╔══██╗"
    putStrLn $ "░░░██║░░░ █████╗░░ ██████╔╝ ██╔████╔██║ ██║░░██║"
    putStrLn $ "░░░██║░░░ ██╔══╝░░ ██╔══██╗ ██║╚██╔╝██║ ██║░░██║"
    putStrLn $ "░░░██║░░░ ███████╗ ██║░░██║ ██║░╚═╝░██║ ╚█████╔╝"
    putStrLn $ "░░░╚═╝░░░ ╚══════╝ ╚═╝░░╚═╝ ╚═╝░░░░░╚═╝ ░╚════╝░" ++ reset

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
        putStrLn "Entrada inválida. Por favor, digite '1', '2' ou '3'."
        putStrLn ""
        showMenu

showRules :: IO ()
showRules = do
  putStrLn ""
  putStrLn "Regras do Jogo:"
  putStrLn " Descubra a palavra certa em até 6 tentativas."
  putStrLn " Depois de cada tentativa, você verá o quão perto está da solução."
  putStrLn $ "  Se a letra selecionada estiver no lugar correto, ela ficará " ++ green ++ "verde" ++ reset ++ "."
  putStrLn $ "  Se a letra estiver na palavra, mas no lugar errado, ela ficará " ++ yellow ++ "amarela" ++ reset ++ "."
  putStrLn $ "  Se a letra não estiver na palavra, ela ficará " ++ red ++ "vermelha" ++ reset ++ "."
  putStrLn "Bom jogo!"
  putStrLn ""
  putStrLn ""


