module Roman where

  import Data.List
  import Data.Monoid(mappend)
  import Data.Maybe(fromJust)

  numerals :: Int -> String
  signs :: [(String, Int)]

  signs = [("M", 1000),
           ("CM", 900),
           ("D",  500),
           ("CD", 400),
           ("C",  100),
           ("XC",  90),
           ("L",   50),
           ("XL",  40),
           ("X",   10),
           ("IX",   9),
           ("V",    5),
           ("IV",   4),
           ("I",    1)]

  numerals number
    | number == 0 = ""
    | otherwise = key `mappend` numerals (number - value)
    where (key, value) = fromJust $ find (flip (<=) number . snd) signs
