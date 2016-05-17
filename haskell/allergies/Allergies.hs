module Allergies
    (
      Allergen(..),
      allergies,
      isAllergicTo
    ) where

    import Data.Bits(testBit)

    data Allergen = Eggs
                    | Peanuts
                    | Shellfish
                    | Strawberries
                    | Tomatoes
                    | Chocolate
                    | Pollen
                    | Cats
                    deriving (Bounded, Enum, Show, Eq)

    allergies :: Int -> [Allergen]
    allergies health = filter isAllergicTo' [minBound ..]
      where isAllergicTo' = flip isAllergicTo health

    isAllergicTo :: Allergen -> Int -> Bool
    isAllergicTo allergen health = testBit health $ fromEnum allergen
