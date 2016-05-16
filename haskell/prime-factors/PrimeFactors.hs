module PrimeFactors (primeFactors) where

  primeFactors :: Integer -> [Integer]
  primeFactors = primeFactors' 2

  primeFactors' :: Integer -> Integer -> [Integer]
  primeFactors' f number
    | number < 2 = []
    | f >= number = [number]
    | otherwise = factor : primeFactors' factor (number `div` factor)
    where factor = head $ take 1 [ next | next <- [f .. number], number `mod` next == 0 ]
