module Phone where
  import Data.Char(isNumber)

  number :: String -> String
  areaCode :: String -> String
  prettyPrint :: String -> String

  number input
    | length digits == 11 && head digits == '1' = tail digits
    | length digits == 10 = digits
    | otherwise = "0000000000"
    where digits = filter isNumber input

  areaCode input
    | length code == 3 = code
    | otherwise = "000"
    where code = take 3 $ filter isNumber input

  prettyPrint input = "(" ++ code ++ ") " ++ middle ++ "-" ++ final
    where (code, rest) = splitAt 3 $ number input
          (middle, final) = splitAt 3  rest
