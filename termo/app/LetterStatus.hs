module LetterStatus (LetterStatus(..)) where

data LetterStatus = Untested | NoExist | WrongPlace | RightPlace
  deriving (Show, Eq)
