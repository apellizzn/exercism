module Bob (responseFor) where

import Data.List
import Data.Char

responseFor :: String -> String

isSilence :: String -> Bool
isScreaming :: String -> Bool
isAsking :: String -> Bool

responseFor phrase
  | isSilence phrase   = "Fine. Be that way!"
  | isScreaming phrase = "Whoa, chill out!"
  | isAsking phrase    = "Sure."
  | otherwise          = "Whatever."

isSilence = null . dropWhile isSpace

isScreaming phrase =  letters /= "" && all isUpper letters  
                      where letters = filter isLetter phrase

isAsking = isSuffixOf "?"
