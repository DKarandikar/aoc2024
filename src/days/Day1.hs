module Day1 where

import Data.List ( sort )
import Data.Hashable(Hashable)
import Data.Map(Map, fromListWith, lookup)
import Data.Maybe(fromMaybe)

day1part1 :: IO ()
day1part1 = do
    input <- readFile "input/day1.txt"
    print $ doDay1Part1 input

day1part2 :: IO ()
day1part2 = do
    input <- readFile "input/day1.txt"
    print $ doDay1Part2 input

doDay1Part1 :: String -> Int
doDay1Part1 s = do
    let list1 = map (\x -> read (head (words x)) :: Int) (lines s) ++ [0]
    let list2 = map (\x -> read (head (reverse (words x))) :: Int) (lines s) ++ [0]
    sum $ map Day1.compare (zip (sort list1) (sort list2))


compare :: (Int, Int) -> Int
compare (x, y) = abs (x - y)


doDay1Part2 :: String -> Int
doDay1Part2 s = do
    let list1 = map (\x -> read (head (words x)) :: Int) (lines s) ++ [0]
    let list2 = map (\x -> read (head (reverse (words x))) :: Int) (lines s) ++ [0]
    
    let counts = toCounter list2

    sum $ map (simScore counts) list1

toCounter :: (Hashable a, Ord a) => [a] -> Map a Int
toCounter = fromListWith (+) . (map (\x -> (x, 1)))

simScore :: Map Int Int -> Int -> Int
simScore m a = a * (fromMaybe 0 (Data.Map.lookup a m))