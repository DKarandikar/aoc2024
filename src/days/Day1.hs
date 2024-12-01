module Day1 where

import Data.List ( sort, singleton )
import Data.Map(Map, fromListWith, lookup)
import Data.Maybe(fromMaybe)

day1part1 :: IO ()
day1part1 = print . doDay1Part1 =<< readFile "input/day1.txt"

day1part2 :: IO ()
day1part2 = print . doDay1Part2 =<< readFile "input/day1.txt"

doDay1Part1 :: String -> Int
doDay1Part1 s = sum $ map diffTuple $ zipSorted $ processInput s

processInput :: String -> [(Int, Int)]
processInput s = foldr lineAggregate [] (lines s)

lineAggregate :: String -> [(Int, Int)] -> [(Int, Int)]
lineAggregate = (++) . singleton . processLine

processLine :: String -> (Int, Int)
processLine s = (read (head (words s)) :: Int, read (last (words s)) :: Int)

zipSorted:: [(Int, Int)] -> [(Int, Int)]
zipSorted x = (zip (sort (map fst x)) (sort (map snd x)))

diffTuple :: (Int, Int) -> Int
diffTuple (x, y) = abs (x - y)

doDay1Part2 :: String -> Int
doDay1Part2 = sum . getSimilarityArray . processInput

getSimilarityArray :: [(Int, Int)] -> [Int]
getSimilarityArray x = map (simScore (toCounter (map snd x))) (map fst x)

toCounter :: [Int] -> Map Int Int
toCounter = fromListWith (+) . (map (\x -> (x, 1)))

simScore :: Map Int Int -> Int -> Int
simScore m a = a * (fromMaybe 0 (Data.Map.lookup a m))