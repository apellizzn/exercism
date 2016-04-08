module SumOfMultiples where
  import Data.List (nub)

  sumOfMultiplesDefault :: Integer -> Integer
  sumOfMultiples :: [Integer] -> Integer -> Integer

  sumOfMultiplesDefault = sumOfMultiples [3, 5]
  sumOfMultiples nums bound = sum . nub . concat $ multiples
        where multiples = [ takeWhile (< bound) $ allMultiples i |  i <- nums ]
              allMultiples i = fmap (* i) [1..]
