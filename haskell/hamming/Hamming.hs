module Hamming(distance) where

  distance :: String -> String -> Integer
  countIfDiff :: Char -> Char -> Integer

  countIfDiff x y
    | x == y = 0
    | otherwise = 1

  distance [] [] = 0
  distance xs ys = countIfDiff (head xs) (head ys) + distance (tail xs) (tail ys)
