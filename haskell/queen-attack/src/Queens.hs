module Queens (boardString, canAttack) where

-- Positions are specified as two-tuples.
-- The first element is is the column (file in Chess terms).
-- The second element is the row (rank in Chess terms).
-- (0, 0) is the top left of the board, and (7, 7) is the bottom right.
  import Data.List
  import Data.Maybe
  import Data.List.Split

  type Queen = (Int, Int)

  boardString :: Maybe Queen -> Maybe Queen -> String
  boardString white black = intercalate "\n" (endBy " \n" (concat ( unfoldr toCells (0, 0)))) `mappend` "\n"
    where
      toCells coord
        | boardEnd = Nothing
        | rowEnd = Just ("\n", (nextRow, 0))
        | continue = Just (fillCell coord, (fst coord, nextCol))
        where
          boardEnd = fst coord == 8
          rowEnd = snd coord == 8
          continue = snd coord < 8
          nextCol = snd coord + 1
          nextRow = fst coord + 1
      fillCell x
        | isJust white && x == fromJust white = "W "
        | isJust black && x == fromJust black = "B "
        | otherwise = "_ "

  canAttack :: Queen -> Queen -> Bool
  canAttack white black = sameRow || sameColumn || sameDiagonal
    where
      sameRow = snd white == snd black
      sameColumn = fst white == fst black
      sameDiagonal = distance white == distance black || attackableMainDiagonal
      distance = abs . uncurry (-)
      attackableMainDiagonal = middleDiagonal white black

  middleDiagonal :: Queen -> Queen -> Bool
  middleDiagonal white black =
    inMainDiagonal white && canAttackFromMainDiagonal white black
    || inMainDiagonal black && canAttackFromMainDiagonal black white
    where
      inMainDiagonal = uncurry (==)
      canAttackFromMainDiagonal main other = uncurry (+) other `div` 2 == fst main
