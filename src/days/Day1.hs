module Day1 where

import Data.List ( sort, singleton )
import Data.Hashable(Hashable)
import Data.Map(Map, fromListWith, lookup)
import Data.Maybe(fromMaybe)

day1part1 :: IO ()
day1part1 = print . doDay1Part1 =<< readFile "input/day1.txt"

day1part2 :: IO ()
day1part2 = print . doDay1Part2 =<< readFile "input/day2.txt"

doDay1Part1 :: String -> Int
doDay1Part1 s = sum $ map Day1.compare $ zipSorted $ processInput s

processInput :: String -> [(Int, Int)]
processInput s = foldr lineAggregate [] (lines s)

lineAggregate :: String -> [(Int, Int)] -> [(Int, Int)]
lineAggregate = (++) . singleton . processLine

processLine :: String -> (Int, Int)
processLine s = (read (head (words s)) :: Int, read (last (words s)) :: Int)

zipSorted:: [(Int, Int)] -> [(Int, Int)]
zipSorted x = (zip (sort (map fst x)) (sort (map snd x)))

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