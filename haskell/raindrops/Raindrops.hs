module Raindrops (convert) where

    import Data.Numbers.Primes
    import Data.Monoid

    convert :: Integer -> String

    convert number
      | null converted = show number
      | otherwise = converted
      where converted = pling `mappend` plang `mappend` plong
            pling
              | 3 `elem` factors = "Pling"
              | otherwise = ""
            plang
              | 5 `elem` factors = "Plang"
              | otherwise = ""
            plong
              | 7 `elem` factors = "Plong"
              | otherwise = ""
            factors = primeFactors number
