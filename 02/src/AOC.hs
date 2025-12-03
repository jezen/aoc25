module AOC where

import Data.List (nub, subsequences)
import Data.Text (isPrefixOf, pack, splitOn, unpack)

parseRanges :: String -> [String]
parseRanges = map show . concatMap (parseRange . unpack) . splitOn "," . pack

parseRange :: String -> [Int]
parseRange x = case splitOn "-" (pack x) of
  [a, b] -> [read (unpack a)..read (unpack b)]
  _      -> []

validId :: String -> Bool
validId xs =
  let (a, b) = splitAt (length xs `div` 2) xs
   in a /= b

validId' :: String -> Bool
validId' xs = not . any match . nub . filter sub . subsequences $ xs
  where
  match x = take (length xs) (cycle x) == xs
  sub x = length x >= 1
       && x /= xs
       && pack x `isPrefixOf` pack xs
       && length xs `mod` length x == 0

f1 :: String -> Int
f1 = sum . map read . filter (not . validId) . parseRanges

f2 :: String -> Int
f2 = sum . map read . filter (not . validId') . parseRanges
