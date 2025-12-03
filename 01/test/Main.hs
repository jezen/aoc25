module Main (main) where

import AOC
import Test.Hspec

input :: String
input = "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"

main :: IO ()
main = hspec $ do

  describe "readRotation" $ do

    it "reads a left rotation" $
      readRotation "L10" `shouldBe` Left 10

    it "reads a right rotation" $
      readRotation "R5" `shouldBe` Right 5

  describe "rotate" $ do

    it "rotates to the right" $
      rotate (11, 0) (Right 8) `shouldBe` (19, 0)

    it "rotates to the left" $
      rotate (50, 0) (Left 10) `shouldBe` (40, 0)

    it "underflows lower bound" $
      rotate (0, 0) (Left 1) `shouldBe` (99, 0)

    it "overflows upper bound" $
      rotate (99, 0) (Right 2) `shouldBe` (1, 0)

    it "counts zeroes" $
      rotate (5, 0) (Left 5) `shouldBe` (0, 1)

  describe "countZeroes" $ do

    it "counts no overflow" $ do
      countZeroes 50 (Right 10) `shouldBe` 0

    it "counts one overflow" $
      countZeroes 50 (Right 100) `shouldBe` 1

    it "counts 10 overflows" $
      countZeroes 50 (Right 1000) `shouldBe` 10

    it "counts zero stop to the right without overflow" $
      countZeroes 50 (Right 50) `shouldBe` 1

    it "counts zero stop to the right with one overflow" $
      countZeroes 50 (Right 150) `shouldBe` 2

    it "counts zero stop to the right with 10 overflows" $
      countZeroes 50 (Right 1050) `shouldBe` 11

    it "counts one underflow" $
      countZeroes 10 (Left 20) `shouldBe` 1

    it "counts 10 underflows" $
      countZeroes 10 (Left 1000) `shouldBe` 10

    it "counts zero stop to the left without underflow" $
      countZeroes 10 (Left 10) `shouldBe` 1

    it "counts zero stop to the left with one underflow" $
      countZeroes 10 (Left 110) `shouldBe` 2

    it "doesn't count underflow when starting at zero" $
      countZeroes 0 (Left 5) `shouldBe` 0

  describe "f1" $ do

    it "solves the test input" $
      f1 input `shouldBe` 3

  describe "f2" $ do

    it "solves the test input" $ do
      f2 input `shouldBe` 6
