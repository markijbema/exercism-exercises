module DNA (toRNA) where
toRNA :: String -> String
toRNA = map nucleotideToRNA
  where nucleotideToRNA 'T' = 'U'
        nucleotideToRNA  x  =  x
