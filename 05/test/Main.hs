{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import AOC
import Data.Text (unpack)
import NeatInterpolation (text)
import Test.Hspec

input :: String
input = unpack
  [text|
    3-5
    10-14
    16-20
    12-18

    1
    5
    8
    11
    17
    32
  |]

main :: IO ()
main = hspec $ do

  describe "parseInterval" $

    it "parses an encoded range into a pair of integers" $
      parseInterval "3-5" `shouldBe` (3, 5)

  describe "withinRange" $

    it "checks whether a number is within inclusive bounds of an interval" $ do
      withinRange 1 (3, 5) `shouldBe` False

  describe "withinAnyRange" $

    it "checks whether a number is within any of the given ranges" $ do
      withinAnyRange 5 [(3, 5)] `shouldBe` True
      withinAnyRange 9 [(3, 5), (7, 10)] `shouldBe` True
      withinAnyRange 6 [(3, 5), (7, 10)] `shouldBe` False

  describe "sortIntervals" $

    it "sorts intervals by lower bound" $
      sortIntervals [ (3, 5), (10, 14), (16, 20), (12, 18) ]
        `shouldBe`  [ (3, 5), (10, 14), (12, 18), (16, 20) ]

  describe "mergeIntervals" $

    it "merges overlapping intervals" $
      mergeIntervals [ (3, 5), (10, 14), (12, 18), (16, 20) ]
        `shouldBe`   [ (3, 5), (10, 20) ]

  describe "f1" $

    it "solves the test input" $
      f1 input `shouldBe` 3

  describe "f2" $

    it "solves the test input" $
      f2 input `shouldBe` 14
