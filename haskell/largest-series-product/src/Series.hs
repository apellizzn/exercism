module Series (largestProduct) where
  import Data.Char
  import Data.List


  largestProduct size digits
    | invalid = Nothing
    | otherwise = Just $ maximum factors
    where
      invalid = size > length digits
      factors = map product $ gropby size numbers
      numbers = map digitToInt digits

  gropby :: Int -> [Int] -> [[Int]]
  gropby size list
    | null list = [[]]
    | length list == size = chunk
    | otherwise = chunk `mappend` gropby size (tail list)
    where
      chunk = [take size list]
