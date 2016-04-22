module DNA(nucleotideCounts, count) where
  import Data.List(find)
  import Data.Maybe(fromMaybe)
  import Data.Map(fromList)
  import Data.Monoid(mappend)

  count :: Char -> String -> Integer
  addIfEqual :: Char -> Char -> Integer
  raiseError :: Show a => a -> t
  notANucleotide :: Char -> Bool

  count _ [] = 0
  count x (y:ys)
    |  notANucleotide x = raiseError x
    |  notANucleotide y = raiseError y
    |  otherwise = addIfEqual x y + count x ys

  nucleotideCounts dna
    | y /= 'A' = raiseError y
    | otherwise = fromList [ (x, count x dna) | x <- "ATCG" ]
      where y = fromMaybe 'A' $ find notANucleotide dna

  notANucleotide x = x `notElem` "ATCG"

  raiseError x = error ("invalid nucleotide " `mappend` show x)

  addIfEqual x y
    | x == y = 1
    | otherwise = 0
