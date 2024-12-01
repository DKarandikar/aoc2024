module Day1Spec where

import Test.Hspec
import Day1

spec :: Spec
spec = do
  describe "Day1" $ do
    it "doDay1 handles simple example" $ do
        testInput <- readFile "test/input/day1.txt"
        doDay1Part1 testInput `shouldBe` 11