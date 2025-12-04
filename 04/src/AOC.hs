module AOC where

import Data.List (transpose, (!?))

indexedMap :: (Int -> a -> b) -> [a] -> [b]
indexedMap f xs = zipWith f [0..] xs

rollAtCell :: Int -> Int -> [String] -> Bool
rollAtCell x y diag =
  case diag !? x of
    Just row -> row !? y == Just '@'
    Nothing  -> False

countRollNeighbours :: Int -> Int -> [String] -> Int
countRollNeighbours x y diag = length $ filter id
  [ rollAtCell (x - 1) (y - 1) diag
  , rollAtCell x       (y - 1) diag
  , rollAtCell (x + 1) (y - 1) diag
  , rollAtCell (x - 1)  y      diag
  , rollAtCell (x + 1)  y      diag
  , rollAtCell (x - 1) (y + 1) diag
  , rollAtCell x       (y + 1) diag
  , rollAtCell (x + 1) (y + 1) diag
  ]

cellHasPaperRoll :: Char -> Bool
cellHasPaperRoll cell = cell == '@'

f1 :: String -> Int
f1 = countLiftable . transpose . lines

liftable :: Int -> Int -> Char -> [String] -> Bool
liftable x y cell d = cellHasPaperRoll cell && countRollNeighbours x y d < 4

countLiftable :: [String] -> Int
countLiftable d =
  sum $ indexedMap
    (\x row ->
      sum $ indexedMap (\y cell ->
        if liftable x y cell d then 1 else 0) row)
        d

removeRolls :: [String] -> [String]
removeRolls d =
  transpose $ indexedMap (\x row ->
    indexedMap
      (\y cell -> if liftable x y cell d then 'x' else cell) row)
      d

f2 :: String -> Int
f2 input =
  let go 0 _ = 0
      go n d = n + go (countLiftable d) (removeRolls d)
      diag = transpose (lines input)
   in go (countLiftable diag) (removeRolls diag)
