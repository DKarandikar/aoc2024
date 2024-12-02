module Day2 where

import Data.List (subsequences)

type Report = [Int]

data Step = Inc | Dec | Fail deriving (Eq)

day2part1 :: IO ()
day2part1 = print . doDay2Part1 =<< readFile "input/day2.txt"

day2part2 :: IO ()
day2part2 = print . doDay2Part2 =<< readFile "input/day2.txt"

doDay2Part1 :: String -> Int
doDay2Part1 s = sum $ map isReportValid (parseInput s)

parseInput :: String -> [Report]
parseInput s = map parseLine (lines s)

parseLine :: String -> Report
parseLine s = map (\x -> read x :: Int) (words s)

isReportValid:: Report -> Int
isReportValid r = fromEnum $ isStepsValid $  map toStep $ window r

isStepsValid :: [Step] -> Bool
isStepsValid x = or [all (==Inc) x, all (==Dec) x]

toStep :: (Int, Int) -> Step
toStep (x, y)  
    | x > y && x - y < 4 = Inc
    | x < y && y - x < 4 = Dec
    | otherwise = Fail


window :: [Int] -> [(Int, Int)]
window [] = []
window xs = zip xs (tail xs)

doDay2Part2 :: String -> Int
doDay2Part2 s = sum $ map isReportValidWithRemoval (parseInput s)

isReportValidWithRemoval:: Report -> Int
isReportValidWithRemoval r = fromEnum $ any (==1) $ map isReportValid $ reportOptions r

reportOptions :: Report -> [Report]
reportOptions r = filter (\x -> length x == length r - 1) (subsequences r)