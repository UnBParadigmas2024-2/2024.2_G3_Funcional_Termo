module Main where

main :: IO ()
main = do
    putStrLn "Digite 'i' para imprimir 'Hello, Haskell!' ou 'p' para imprimir 'Olá, Haskell!':"
    input <- getLine
    if input == "i" then
        putStrLn "Hello, Haskell!"
    else if input == "p" then
        putStrLn "Olá, Haskell!"
    else
        putStrLn "Entrada inválida. Por favor, digite 'i' ou 'p'."