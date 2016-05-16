module Binary (toDecimal) where

    import Data.List
    import Data.Maybe
    import Data.Char

    toDecimal :: String -> Int
    toDecimalDigit :: Char -> Int -> Int

    toDecimal n
      | isJust wrong = 0
      | otherwise = sum $ zipWith toDecimalDigit (reverse n) [0..]
      where wrong = find (`notElem` "01") n

    toDecimalDigit x y = 2 ^ y * digitToInt x
