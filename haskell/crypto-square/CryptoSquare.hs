module CryptoSquare
    (
      normalizePlaintext,
      squareSize,
      plaintextSegments,
      ciphertext,
      normalizeCiphertext
    ) where

      import Control.Applicative
      import Data.Char
      import Data.List
      import Data.List.Split

      normalizePlaintext :: String -> String
      normalizePlaintext text = toLower <$> filter isAlphaNum text

      squareSize :: String -> Int
      squareSize =  ceiling . sqrt . fromIntegral . length

      plaintextSegments :: String -> [String]
      plaintextSegments text = chunksOf (squareSize normalized) normalized
        where normalized = normalizePlaintext text

      ciphertext :: String -> String
      ciphertext = concat . transpose . plaintextSegments

      normalizeCiphertext :: String -> String
      normalizeCiphertext = unwords . transpose . plaintextSegments
