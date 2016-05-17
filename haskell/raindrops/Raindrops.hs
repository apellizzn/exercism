module Raindrops (convert) where

    import Data.Numbers.Primes
    import Data.Monoid

    convert :: Integer -> String
    convert number
      | null converted = show number
      | otherwise = converted
      where converted = pling `mappend` plang `mappend` plong
            pling = translate 3 "Pling" factors
            plang = translate 5 "Plang" factors
            plong = translate 7 "Plong" factors
            factors = primeFactors number

    translate :: Integer -> String -> [Integer] -> String
    translate digit word factors
      | digit `elem` factors = word
      | otherwise = ""
