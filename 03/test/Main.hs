module Main (main) where

import AOC
import Test.Hspec

input :: String
input = "987654321111111\n\
        \811111111111119\n\
        \234234234234278\n\
        \818181911112111\n"

main :: IO ()
main = hspec $ do

  describe "readJoltage" $ do

    it "reads the joltage for 2 batteries in a bank" $ do
      readJoltage 2 "987654321111111" `shouldBe` "98"
      readJoltage 2 "811111111111119" `shouldBe` "89"
      readJoltage 2 "234234234234278" `shouldBe` "78"
      readJoltage 2 "818181911112111" `shouldBe` "92"

  describe "readBigJoltage" $ do

    it "reads the joltage for 12 batteries in a bank" $ do
      readJoltage 12 "987654321111111" `shouldBe` "987654321111"
      readJoltage 12 "811111111111119" `shouldBe` "811111111119"
      readJoltage 12 "234234234234278" `shouldBe` "434234234278"
      readJoltage 12 "818181911112111" `shouldBe` "888911112111"

  describe "f1" $

    it "solves the test input" $
      f1 input `shouldBe` 357

  describe "f2" $

    it "solves the test input" $
      f2 input `shouldBe` 3121910778619
