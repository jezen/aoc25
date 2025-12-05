module AOC where

import Data.Char (isDigit)
import Data.List (partition, sortBy)

type Interval = (Int, Int)

parseInterval :: String -> Interval
parseInterval x = (read lower, read upper)
  where lower = takeWhile isDigit x
        upper = drop (length lower + 1) x

withinRange :: Int -> Interval -> Bool
withinRange n (a, b) = n >= a && n <= b

withinAnyRange :: Int -> [Interval] -> Bool
withinAnyRange n intervals = any (withinRange n) intervals

sortIntervals :: [Interval] -> [Interval]
sortIntervals = sortBy (\(a, _) (b, _) -> compare a b)

mergeIntervals :: [Interval] -> [Interval]
mergeIntervals [] = []
mergeIntervals [x] = [x]
mergeIntervals (a:b:xs) =
  if snd a >= fst b
  then mergeIntervals ((fst a, max (snd a) (snd b)) : xs)
  else a : mergeIntervals (b : xs)

f1 :: String -> Int
f1 input =
  let isRange s = '-' `elem` s
      (rs, xs) = map read . drop 1 <$> partition isRange (lines input)
      fresh = parseInterval <$> rs
   in length (filter (\x -> withinAnyRange x fresh) xs)

f2 :: String -> Int
f2 input =
  let rs = takeWhile (/= "") (lines input)
      f a b = a + (snd b - fst b + 1)
   in foldl' f 0 (mergeIntervals (sortIntervals (parseInterval <$> rs)))
