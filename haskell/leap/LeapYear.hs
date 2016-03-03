module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isReallyLeap :: Int -> Bool

isLeapYear year
  | year `mod` 4 == 0 = isReallyLeap year 
  | otherwise = False

isReallyLeap year
  | year `mod` 100 == 0 = year `mod` 400 == 0
  | otherwise = True


