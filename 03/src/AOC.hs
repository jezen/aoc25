module AOC where

import Data.Char (digitToInt, intToDigit)
import Data.List (elemIndex)
import Data.Maybe (fromMaybe)

readJoltage :: Int -> String -> String
readJoltage 0 _  = []
readJoltage _ [] = []
readJoltage k bank =
  let batteries = digitToInt <$> bank
      a = maximum $ take (length bank - k + 1) batteries
      i = fromMaybe 0 (elemIndex a batteries)
   in intToDigit a : readJoltage (k - 1) (drop (i + 1) bank)

f1 :: String -> Int
f1 xs = sum $ map (read . readJoltage 2) $ lines xs

f2 :: String -> Int
f2 xs = sum $ map (read . readJoltage 12) $ lines xs
