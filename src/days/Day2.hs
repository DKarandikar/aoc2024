module Day2 where

type Report = [Int]

data Step = Inc | Dec | Fail deriving (Eq)

day2part1 :: IO ()
day2part1 = print . doDay2Part1 =<< readFile "input/day2.txt"

day2part2 :: IO ()
day2part2 = print $ "day2part2"

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