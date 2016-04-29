module LinkedList where

  data LinkedList a = Next a (LinkedList a) | Nil deriving(Show, Eq)

  nil :: LinkedList a
  nil = Nil

  isNil :: LinkedList a -> Bool
  isNil list = case list of
    Nil -> True
    _ -> False

  datum :: LinkedList a -> a
  datum l = case l of
    Next a _ -> a
    Nil -> error "Nope"

  fromList :: [a] -> LinkedList a
  fromList [] = Nil
  fromList xs = foldr Next Nil xs

  toList :: LinkedList a -> [a]
  toList Nil = []
  toList (Next a list) = a : toList list

  new :: a -> LinkedList a -> LinkedList a
  new = Next

  next :: LinkedList a -> LinkedList a
  next Nil = Nil
  next (Next _  list) = list

  reverseLinkedList :: LinkedList a -> LinkedList a
  reverseLinkedList list = fromList .reverse . toList $ list
