module Garden
    (
      Plant(..),
      garden,
      defaultGarden,
      lookupPlants
    ) where

    import Data.List
    import Data.List.Split
    import Data.Maybe
    import qualified Data.Map.Strict as M

    type Garden = M.Map Children [Plant]
    type Children = String

    data Plant = Violets | Grass | Clover | Radishes deriving (Show, Eq)

    garden :: [Children] -> String -> Garden
    garden children g = M.fromList $ zip children' plants
      where
            children' = sort children
            plants = fmap (fmap toPlant . concat) by4
            by4 = transpose by2
            by2 = fmap (chunksOf 2) plantsRows
            plantsRows = splitOn "\n" g
            toPlant c = case c of
              'V' -> Violets
              'G' -> Grass
              'C' -> Clover
              'R' -> Radishes


    defaultGarden :: String -> Garden
    defaultGarden = garden defaultChildren

    defaultChildren :: [String]
    defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred",
      "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    lookupPlants :: String -> Garden -> [Plant]
    lookupPlants child = fromJust . M.lookup child
