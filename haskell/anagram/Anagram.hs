module Anagram(anagramsFor) where
  import Data.List
  import Data.Char

  anagramsFor :: String -> [String] -> [String]
  isAnagram :: String -> String -> Bool

  anagramsFor word list = [ other | other <- list, isAnagram word other ]

  isAnagram word other =
      lowerWord /= lowerOther
      && sort lowerWord == sort lowerOther
      where (lowerWord, lowerOther) = (fmap toLower word, fmap toLower other)
