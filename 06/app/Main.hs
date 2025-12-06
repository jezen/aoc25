module Main (main) where

import AOC

main :: IO ()
main = do
  input <- getContents
  print $ f1 input
  print $ f2 input
