module Attempt where


-- TODO: Issue 5
showAttemptNum :: Int -> IO ()
showAttemptNum attemptNum = do
    putStrLn ("Tentativa " ++ show attemptNum)



-- TODO: Issue 7
getAttempt :: IO String
getAttempt = do
    line <- getLine
    return line


-- TODO: Issue 9
-- Aqui talvez seja melhor passar o data inteiro de gameState e retornar ele modificado (Relacioando com a Issue 2)
processAttempt :: String -> String -> IO Bool
processAttempt secretWord attempt = do
    putStrLn (secretWord ++ " É DIFERENTE DE " ++ attempt)
    return False