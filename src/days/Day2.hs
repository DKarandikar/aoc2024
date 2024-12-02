module Day2 where

import Data.List (subsequences)

type Report = [Int]

data Step = Inc | Dec | Fail deriving (Eq)

day2part1 :: IO ()
day2part1 = print . doDay2Part1 =<< readFile "input/day2.txt"

day2part2 :: IO ()
day2part2 = print . doDay2Part2 =<< readFile "input/day2.txt"

doDay2Part1 :: String -> Int
doDay2Part1 = countValidReports isReportValid

doDay2Part2 :: String -> Int
doDay2Part2 = countValidReports isReportValidWithRemoval

countValidReports :: (Report -> Bool) -> String -> Int
countValidReports fn = sum . map (fromEnum . fn) . parseInput

parseInput :: String -> [Report]
parseInput = map parseLine . lines

parseLine :: String -> Report
parseLine = map (\x -> read x :: Int) . words

isReportValid:: Report -> Bool
isReportValid = isStepsValid . map toStep . window

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

isReportValidWithRemoval:: Report -> Bool
isReportValidWithRemoval = any (==True) . map isReportValid . reportOptions

reportOptions :: Report -> [Report]
reportOptions r = filter (\x -> length x == length r - 1) $ subsequences r