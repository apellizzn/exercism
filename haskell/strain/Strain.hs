module Strain where
  keep :: (a -> Bool) -> [a] -> [a]
  discard :: (a -> Bool) -> [a] -> [a]

  keep _ [] = []

  keep f [x]
    | f x = [x]
    | otherwise = []

  keep f (x:xs) = keep f [x] ++ keep f xs

  discard f = keep (not . f)
