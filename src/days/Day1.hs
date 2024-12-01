module Day1 where

import Data.List ( sort )

day1part1 :: IO ()
day1part1 = do
    input <- readFile "input/day1.txt"
    print $ doDay1Part1 input

day1part2 :: IO ()
day1part2 = print $ "day1part2"

doDay1Part1 :: String -> Int
doDay1Part1 s = do
    let list1 = map (\x -> read (head (words x)) :: Int) (lines s) ++ [0]
    let list2 = map (\x -> read (head (reverse (words x))) :: Int) (lines s) ++ [0]
    sum $ map Day1.compare (zip (sort list1) (sort list2))


compare :: (Int, Int) -> Int
compare (x, y) = abs (x - y)


doDay1Part2 :: String -> Int
doDay1Part2 s = 1