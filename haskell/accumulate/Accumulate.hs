module Accumulate (accumulate) where

accumulate :: (t -> a) -> [t] -> [a]

accumulate _ [] = []
accumulate f (x:xs) = f x : accumulate f xs
