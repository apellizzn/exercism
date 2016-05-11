module Triangle
    (
      TriangleType(..),
      triangleType
    ) where

    data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Eq, Show)

    triangleType :: Int -> Int -> Int -> TriangleType
    triangleType a b c
      | a  * b * c == 0 = Illogical
      | a + b <= c || b + c <= a || a + c <= b = Illogical
      | a /= b && b /= c && c /= a = Scalene
      | a == b && b == c && c == a = Equilateral
      | otherwise = Isosceles
