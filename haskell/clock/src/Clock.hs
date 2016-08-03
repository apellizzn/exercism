module Clock (clockHour, clockMin, fromHourMin, toString) where

  data Clock = Clock { hours :: Integer, minutes :: Integer } deriving (Eq, Show)

  instance Num Clock where
      (+) c1 c2 = fromInteger ((hours c1 + hours c2) * 60 + minutes c1 + minutes c2)
      (*) c1 c2 = fromInteger ((hours c1 * hours c2) * 60 + minutes c1 * minutes c2)
      (-) c1 c2 = fromInteger ((hours c1 - hours c2) * 60 + minutes c1 - minutes c2)
      fromInteger n = Clock h m
        where
          h = (n `div` 60) `mod` 24
          m = n `mod` 60
      abs c1 = c1
      signum c1 = c1
      negate c1 = Clock h m
        where
          h = 24 - hours c1 - 1
          m = 60 - minutes c1

  clockHour :: Clock -> Int
  clockHour = fromInteger . hours

  clockMin :: Clock -> Int
  clockMin = fromInteger . minutes

  fromHourMin :: Int -> Int -> Clock
  fromHourMin h m= fromInteger (toInteger h * 60 + toInteger m)

  toString :: Clock -> String
  toString c = toStringUnit hours `mappend` ":" `mappend` toStringUnit minutes
    where
      toStringUnit f
        | f c > 9 = show $ f c
        | otherwise = '0' : show (f c)
