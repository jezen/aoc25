module AOC where

import Data.Char (isDigit)
import Data.List (transpose)

splitProblems :: String -> [[String]]
splitProblems = map reverse . transpose . map words . lines

toCephalopod :: String -> [[String]]
toCephalopod xs =
  let ns  = columns $ transpose $ lines xs
      ops = words $ last $ lines xs
   in zipWith (:) ops ns

columns :: [String] -> [[String]]
columns [] = []
columns xs =
  let col = takeWhile (any isDigit) xs
   in map (filter isDigit) col : columns (drop (length col + 1) xs)

solve :: [String] -> Int
solve ("+":xs) = foldl' (+) 0 (read <$> xs)
solve ("*":xs) = foldl' (*) 1 (read <$> xs)
solve _        = 0

f1 :: String -> Int
f1 = sum . map solve . splitProblems

f2 :: String -> Int
f2 = sum . map solve . toCephalopod
