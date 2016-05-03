module WordCount where
  import qualified Data.Map.Lazy as M
  import Data.Char
  import Data.List.Split

  separators :: String
  separators = " ,_."

  isValid :: Char -> Bool
  isValid x = isAlphaNum x || x `elem` separators

  wordCount :: String -> M.Map String Int
  wordCount phrase =  foldl reduce M.empty (fmap toHashMap _words)
    where reduce = M.unionWith (+)
          toHashMap x = M.insert x 1 M.empty
          _words = split (dropBlanks . dropDelims $ oneOf separators) cleanPhrase
          cleanPhrase = fmap toLower (filter isValid phrase)
