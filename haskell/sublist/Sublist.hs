module Sublist (sublist, Sublist(Equal, Sublist, Superlist, Unequal)) where

import Data.List
data Sublist = Equal | Sublist | Superlist | Unequal deriving(Show, Eq)

sublist :: (Eq a) => [a] -> [a] -> Sublist


sublist xs ys
  | xs == ys = Equal
  | ys `isInfixOf` xs = Superlist
  | xs `isInfixOf` ys = Sublist
  | otherwise = Unequal
