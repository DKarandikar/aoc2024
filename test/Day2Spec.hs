module Day2Spec where

import Test.Hspec
import Day2

spec :: Spec
spec = do
  describe "2" $ do
    it "doDay2Part1 handles simple example" $ do
        testInput <- readFile "test/input/day2.txt"
        doDay2Part1 testInput `shouldBe` 2

    it "window handles simple example" $ do
      window [1, 2, 3, 4] `shouldBe` [(1, 2), (2, 3), (3, 4)]

    it "doDay2Part2 handles simple example" $ do
      testInput <- readFile "test/input/day2.txt"
      doDay2Part2 testInput `shouldBe` 4