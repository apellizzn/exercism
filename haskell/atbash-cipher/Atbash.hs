module Atbash(encode) where

  import Data.List(elemIndex)
  import Data.List.Split(chunksOf)
  import Data.Maybe(fromJust, isJust)
  import Data.Char

  encode :: String -> String
  encode d = init $ (=<<) addWhitespace (every5Letters encoded)
    where encoded = fmap transform validInput
          validInput = filter isValid d
          isValid x = isAscii x && isAlphaNum x
          every5Letters = chunksOf 5
          addWhitespace = flip (++) " "
          transform = mask . toLower

  mask :: Char -> Char
  mask symbol
    | isJust index && halfUp = opposite (12 -) (flip (-) 13)
    | isJust index && halfDown = opposite (12 +) (13 -)
    | otherwise = symbol
    where alphabet = ['a'..'z']
          index = symbol `elemIndex` alphabet
          tryIndex = fromJust index
          halfUp   =  tryIndex  > 12
          halfDown =  tryIndex <= 13
          opposite a b = alphabet !! a (b tryIndex)
