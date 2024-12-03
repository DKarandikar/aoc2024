module Day3 where

import Data.Char (isDigit)

day3part1 :: IO ()
day3part1 = print . doDay3Part1 =<< readFile "input/day3.txt"

day3part2 :: IO ()
day3part2 = print $ "day3part2"

doDay3Part1 :: String -> Int
doDay3Part1 = parseMul 0

parseMul :: Int -> String -> Int
parseMul acc s 
    | take 4 s == "mul(" = parseFirstNumber acc $ drop 4 s
    | length s == 0 = acc
    | otherwise = parseMul acc $ drop 1 s

parseFirstNumber :: Int -> String -> Int
parseFirstNumber acc s 
    | (and (map isDigit $ take 3 s)) && head (drop 3 s) == ',' 
        = parseSecondNumber acc (read (take 3 s) :: Int) (drop 4 s)
    | (and (map isDigit $ take 2 s)) && head (drop 2 s) == ',' 
        = parseSecondNumber acc (read (take 2 s) :: Int) (drop 3 s)
    | (isDigit $ head s) && head (drop 1 s) == ',' 
        = parseSecondNumber acc (read (take 1 s) :: Int) (drop 2 s)
    | otherwise = parseMul acc $ drop 1 s

parseSecondNumber :: Int -> Int -> String -> Int
parseSecondNumber acc first s 
    | (and (map isDigit $ take 3 s)) && head (drop 3 s) == ')' 
        = parseMul (acc + ((read (take 3 s) :: Int) * first)) (drop 4 s)
    | (and (map isDigit $ take 2 s)) && head (drop 2 s) == ')' 
        = parseMul (acc + ((read (take 2 s) :: Int) * first)) (drop 3 s)
    | (isDigit $ head s) && head (drop 1 s) == ')' 
        = parseMul (acc + ((read (take 1 s) :: Int) * first)) (drop 2 s)
    | otherwise = parseMul acc $ drop 1 s