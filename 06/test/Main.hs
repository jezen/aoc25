{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import AOC
import Data.Text (unpack)
import NeatInterpolation (text)
import Test.Hspec

input :: String
input = unpack
  [text|
    123 328  51 64
     45 64  387 23
      6 98  215 314
    *   +   *   +
  |]

main :: IO ()
main = hspec $ do

  describe "splitProblems" $

    it "splits and transposes the problems" $
      splitProblems input `shouldBe`
        [ [ "*", "6",   "45",  "123" ]
        , [ "+", "98",  "64",  "328" ]
        , [ "*", "215", "387", "51"  ]
        , [ "+", "314", "23",  "64"  ]
        ]

  describe "solve" $

    it "solves individual problems" $ do
      solve [ "*", "6",   "45",  "123" ] `shouldBe` 33210
      solve [ "+", "98",  "64",  "328" ] `shouldBe` 490
      solve [ "*", "215", "387", "51"  ] `shouldBe` 4243455
      solve [ "+", "314", "23",  "64"  ] `shouldBe` 401

  describe "toCephalopod" $

    it "splits and transposes the problems into RTL columns" $
      toCephalopod input `shouldBe`
        [ [ "*", "1",   "24",   "356" ]
        , [ "+", "369", "248",  "8"   ]
        , [ "*", "32",  "581",  "175" ]
        , [ "+", "623", "431",  "4"   ]
        ]

  describe "f1" $

    it "solves the test input" $
      f1 input `shouldBe` 4277556

  describe "f2" $

    it "solves the test input" $
      f2 input `shouldBe` 3263827
