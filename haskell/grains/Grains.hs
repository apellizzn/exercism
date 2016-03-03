module Grains (square, total) where

total :: Integer
square :: Integer -> Integer

total = 2 ^ 64 - 1

square n = 2 ^ (n - 1)
