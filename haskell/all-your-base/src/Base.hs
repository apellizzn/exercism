module Base (rebase) where
    import Data.Maybe
    import Data.List
    rebase :: Integral a => a -> a -> [a] -> Maybe [a]
    rebase inputBase outputBase inputDigits
      | badBases || invalidInput = Nothing
      | otherwise  = Just (toDigits decimalConvertedAmmount)
      where
        badBases = outputBase <= 1 || inputBase <= 1
        invalidInput = isJust $ find badDigit inputDigits
        decimalConvertedAmmount = sum (mapWithInd toDecimal input)
        mapWithInd f l = zipWith f l [0..]
        toDecimal x i = x * inputBase ^ i
        input = reverse inputDigits
        badDigit x = x >= inputBase || x < 0
        toDigits = reverse . unfoldr nextDigit
        nextDigit digit
          | digit == 0 = Nothing
          | otherwise = Just (digit `mod` outputBase, rest)
          where
            rest = digit `div` outputBase
