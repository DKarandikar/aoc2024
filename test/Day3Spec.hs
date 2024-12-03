module Day3Spec where

import Test.Hspec
import Day3

spec :: Spec
spec = do
  describe "3" $ do
    it "doDay3Part1 handles simple example" $ do
      testInput <- readFile "test/input/day3.txt"
      doDay3Part1 testInput `shouldBe` 161
    
    it "doDay3Part2 handles simple example" $ do
      testInput <- readFile "test/input/day3-2.txt"
      doDay3Part2 testInput `shouldBe` 48