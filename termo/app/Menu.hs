module Menu where


showScore :: String -> Int -> IO ()
showScore secretWord attemptNum 
    | attemptNum == 0 = do
        putStrLn "Voce perdeu :("
        putStrLn ("A palavra secreta era: " ++ secretWord)
    | otherwise = do
        putStrLn "Parabéns, você ganhou!"
        putStrLn ("A palavra secreta era: " ++ secretWord)
        putStrLn ("Sua pontuação foi: " ++ show (400 + attemptNum*100))