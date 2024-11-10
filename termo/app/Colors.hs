module Colors (green, yellow, red, purple, reset) where

-- Definindo os códigos de cores ANSI
green :: String
green = "\x1b[32m"  -- Código ANSI para verde

yellow :: String
yellow = "\x1b[33m" -- Código ANSI para amarelo

red :: String
red = "\x1b[31m"    -- Código ANSI para vermelho

purple :: String
purple = "\x1b[34m"    -- Código ANSI para vermelho

reset :: String
reset = "\x1b[0m"   -- Código ANSI para resetar a cor