module Main (main) where

import AOC
import Test.Hspec

input :: String
input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,\
  \1698522-1698528,446443-446449,38593856-38593862,565653-565659,\
  \824824821-824824827,2121212118-2121212124"

main :: IO ()
main = hspec $ do

  describe "parseRange" $ do

    it "parses pairs of numbers into ranges" $ do
      parseRange "11-22" `shouldBe` [11..22]
      parseRange "95-115" `shouldBe` [95..115]
      parseRange "998-1012" `shouldBe` [998..1012]
      parseRange "1188511880-1188511890" `shouldBe` [1188511880..1188511890]
      parseRange "222220-222224" `shouldBe` [222220..222224]
      parseRange "1698522-1698528" `shouldBe` [1698522..1698528]
      parseRange "446443-446449" `shouldBe` [446443..446449]
      parseRange "38593856-38593862" `shouldBe` [38593856..38593862]
      parseRange "565653-565659" `shouldBe` [565653..565659]
      parseRange "824824821-824824827" `shouldBe` [824824821..824824827]
      parseRange "2121212118-2121212124" `shouldBe` [2121212118..2121212124]

  describe "validId" $ do

    it "identifies invalid IDs" $ do
      validId "11" `shouldBe` False
      validId "99" `shouldBe` False
      validId "1010" `shouldBe` False
      validId "1188511885" `shouldBe` False
      validId "222222" `shouldBe` False
      validId "446446" `shouldBe` False
      validId "38593859" `shouldBe` False

    it "identifies valid IDs" $
      validId "12" `shouldBe` True

  describe "validId'" $ do

    it "identifies invalid IDs" $ do
      validId' "11" `shouldBe` False

    it "identifies valid IDs" $ do
      validId' "12" `shouldBe` True
      validId' "101" `shouldBe` True

  describe "f1" $

    it "solves the test input" $
      f1 input `shouldBe` 1227775554

  describe "f2" $

    it "solves the test input" $
      f2 input `shouldBe` 4174379265
