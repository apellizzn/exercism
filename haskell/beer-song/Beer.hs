module Beer
    (
      verse,
      sing
    ) where

  import Data.Monoid(mappend)
  import Data.Char
  
  verse :: Int -> String
  verse n = zeroOrMore `mappend` " bottle" `mappend` pluralOrSingular n
            `mappend` " of beer on the wall, "
            `mappend` fmap toLower zeroOrMore `mappend` " bottle"
            `mappend` pluralOrSingular n `mappend` " of beer.\n"
            `mappend` takeOrRefill
            `mappend` next `mappend` " bottle"
            `mappend` pluralOrSingular (n - 1)
            `mappend` " of beer on the wall.\n"
            where pluralOrSingular num = if num == 1 then "" else "s"
                  takeOrRefill = case n of
                    0 -> "Go to the store and buy some more, "
                    _ -> "Take " `mappend` oneOrMore `mappend` " down and pass it around, "
                  zeroOrMore = case n of
                    0 -> "No more"
                    _ -> show n
                  next = case n - 1 of
                    -1 -> "99"
                    0  -> "no more"
                    _ -> show (n - 1)
                  oneOrMore = case n of
                    1 -> "it"
                    _ -> "one"

  sing :: Int -> Int -> String
  sing from to
    | from == to = currentVerse
    | otherwise  = currentVerse `mappend` sing (from - 1) to
    where currentVerse = verse from `mappend` "\n"
