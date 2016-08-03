module Luhn (addends, checkDigit, checksum, create, isValid) where
  import Data.List
  import Data.Maybe

  addends number = reverse . toLuhn $ toList number

  checkDigit :: Integer -> Integer
  checkDigit number = head (toList number)

  toList :: Integer -> [Integer]
  toList = unfoldr dividingBy10
    where
      dividingBy10 n
        | n == 0 = Nothing
        | otherwise = Just (digit, n `div` 10)
        where
          digit = n `mod` 10

  toLuhn :: [Integer] -> [Integer]
  toLuhn list = case list of
    [] -> []
    (x:y:rest) -> x : encode y : toLuhn rest
    _ -> list
    where
      encode n
       | double >= 10 = double - 9
       | otherwise = double
       where
         double = n * 2

  checksum :: Integer -> Integer
  checksum number = sum (addends number) `mod` 10

  create :: Integer -> Integer
  create number = fromJust $ find isValid combinations
    where
      combinations = [newNumber x | x <- [0..9]]
      newNumber x = number * 10 + x

  isValid number = checksum number == 0
