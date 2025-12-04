{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import AOC
import Data.Text (unpack)
import NeatInterpolation (text)
import Test.Hspec

input :: String
input = unpack
  [text|
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
  |]

main :: IO ()
main = hspec $ do

  describe "f1" $

    it "solves the test input" $
      f1 input `shouldBe` 13

  describe "f2" $

    it "solves the test input" $
      f2 input `shouldBe` 43
