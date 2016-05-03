module ETL (transform) where
  import Data.Char (toLower)
  import Data.Map (Map, empty, foldrWithKey, insert)

  transform :: Map Int [String] -> Map String Int
  transform =  foldrWithKey explode empty

  explode :: Int -> [String] -> Map String Int -> Map String Int
  explode _ [] base = base
  explode points (letter:letters) base = insert (toLowerStr letter) points rest
    where toLowerStr = fmap toLower
          rest = explode points letters base
