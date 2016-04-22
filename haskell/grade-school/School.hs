module School(School, add, empty, sorted, grade) where
  import qualified Data.Map as Map
  import Data.List

  type Grade = Int
  type Name = String
  type School = Map.Map Grade [Name]

  add :: Grade -> Name -> School -> School
  add g name = Map.insertWith (++) g [name]

  empty :: School
  empty = Map.empty

  sorted :: School -> [(Grade, [Name])]
  sorted = Map.toAscList . Map.mapWithKey sortNames
    where sortNames _  = sort

  grade :: Int -> School -> [Name]
  grade = Map.findWithDefault []
