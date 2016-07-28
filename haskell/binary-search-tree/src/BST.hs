module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where
-- The task is to create the data type `BST`, with `Eq`
-- and `Show` instances, and implement the functions below.
  import Data.Maybe(Maybe)

  data BST a =   BST { left :: BST a, right :: BST a, value :: a }
               | Nil deriving (Eq, Show)

  bstLeft :: BST a -> Maybe (BST a)
  bstLeft bst = Just $ left bst

  bstRight :: BST a -> Maybe (BST a)
  bstRight bst = Just $ right bst

  bstValue :: BST a -> Maybe a
  bstValue bst = case bst of
    Nil -> Nothing
    _   -> Just $ value bst

  empty :: BST a
  empty = Nil

  fromList :: Ord a => [a] -> BST a
  fromList list = reverseInsert (reverse list)
    where
      reverseInsert list = case list of
        x:xs -> insert x $ reverseInsert xs
        _    -> Nil

  insert :: Ord a => a -> BST a -> BST a
  insert x bst
    | bst == empty = singleton x
    | value bst >= x = insertLeft
    | otherwise = insertRight
    where
      insertLeft  = BST { left = leftBST, right = right bst, value = value bst }
      insertRight = BST { left = left bst, right = rightBST, value = value bst }
      leftBST  = insert x $ left bst
      rightBST = insert x $ right bst

  singleton :: a -> BST a
  singleton = BST empty empty

  toList :: BST a -> [a]
  toList bst = case bst of
    Nil -> []
    _ -> toList (left bst) `mappend` [value bst] `mappend` toList (right bst)
