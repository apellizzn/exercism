module Robot
    (
      Robot(..),
      Bearing(..),
      mkRobot,
      turnLeft,
      turnRight,
      simulate
    ) where

  type Path = String

  type Coordinates = (Integer, Integer)
  data Bearing = South | East | North | West deriving (Show, Eq, Enum)
  data Robot = Robot {
    bearing :: Bearing,
    coordinates :: Coordinates
  } deriving (Show, Eq)

  mkRobot :: Bearing -> Coordinates -> Robot
  mkRobot = Robot

  turnLeft :: Bearing -> Bearing
  turnLeft w = case w of
    South -> East
    North -> West
    West -> South
    East -> North

  turnRight :: Bearing -> Bearing
  turnRight w = turnLeft $ toEnum opposite
    where opposite = (fromEnum w + 2) `mod` 4

  simulate :: Robot -> Path -> Robot
  simulate = foldl transform
     where
       transform rob x = case x of
         'R' -> mkRobot (turnRight currentBearing) currentCoordinates
         'L' -> mkRobot (turnLeft currentBearing) currentCoordinates
         _   -> advance rob
         where
           currentCoordinates = coordinates rob
           currentBearing = bearing rob

  xFor :: Robot -> Integer
  xFor r = case bearing r of
    East -> fst (coordinates r) + 1
    West -> fst (coordinates r) - 1
    _ -> fst $ coordinates r

  yFor :: Robot -> Integer
  yFor r = case bearing r of
    North -> snd (coordinates r) + 1
    South -> snd (coordinates r) - 1
    _ -> snd  (coordinates r)

  advance :: Robot -> Robot
  advance r = withSameBearing (xFor r, yFor r)
    where
      withSameBearing = mkRobot (bearing r)
