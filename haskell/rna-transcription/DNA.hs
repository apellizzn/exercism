module DNA (toRNA) where

toRNA :: String -> String
complement :: Char -> Char

toRNA [] = []
toRNA xs = map complement xs

complement nucleotide
  | nucleotide == 'G' = 'C'
  | nucleotide == 'C' = 'G'
  | nucleotide == 'T' = 'A'
  | otherwise = 'U'
