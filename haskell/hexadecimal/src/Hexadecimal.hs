module Hexadecimal (hexToInt) where
  import Data.Char
  import Data.List
  import Data.Maybe

  hexToInt :: String -> Int
  hexToInt hex
    | any notAllowed hex = 0
    | otherwise = sum decimalValues
    where
      notAllowed x = not(isNumber x) && isNothing (x `elemIndex` alphabet)
      decimalValues = zipWith toDecimalValue toDigits exponents
      exponents = [0..]
      toDigits  = fmap toDecimalDigit (reverse hex)

  toDecimalValue :: Int -> Int -> Int
  toDecimalValue x ex = x * (16 ^ ex)

  toDecimalDigit :: Char -> Int
  toDecimalDigit x
    | isNumber x = digitToInt x
    | isLetter x = 10 + fromJust (x `elemIndex` alphabet)
    | otherwise = 0

  alphabet :: String
  alphabet = ['a'..'f']
