module WordCount (wordCount) where
import qualified Data.Map as Map
import Data.Char (toLower, isAlphaNum)

wordCount :: String -> Map.Map String Int
wordCount = countOccurences . words . sanitize

countOccurences :: Ord a => [a] -> Map.Map a Int
countOccurences l = Map.fromListWith (+) (map toTuple l)
  where toTuple x = (x, 1)

sanitize = map (toLower . removePunctuation)
  where removePunctuation x
          | isAlphaNum x = x
          | otherwise    = ' '
