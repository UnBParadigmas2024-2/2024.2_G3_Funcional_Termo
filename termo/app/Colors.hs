module Colors where

-- Definindo os códigos de cores ANSI
green :: String
green = "\x1b[32m"  -- Código ANSI para verde

yellow :: String
yellow = "\x1b[33m" -- Código ANSI para amarelo

red :: String
red = "\x1b[31m"    -- Código ANSI para vermelho

purple :: String
purple = "\x1b[34m"    -- Código ANSI para vermelho

gray :: String
gray = "\x1b[90m"   -- Código ANSI para cinza

reset :: String
reset = "\x1b[0m"   -- Código ANSI para resetar a cor