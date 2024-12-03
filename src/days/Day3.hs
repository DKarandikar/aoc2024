module Day3 where

import Data.Char (isDigit)

day3part1 :: IO ()
day3part1 = print . doDay3Part1 =<< readFile "input/day3.txt"

day3part2 :: IO ()
day3part2 = print . doDay3Part2 =<< readFile "input/day3.txt"

doDay3Part1 :: String -> Int
doDay3Part1 = parseMul False True 0

doDay3Part2 :: String -> Int
doDay3Part2 = parseMul True True 0

parseMul :: Bool -> Bool -> Int -> String -> Int
parseMul control enabled acc s 
    | enabled && take 4 s == "mul(" 
        = (\(x,y) -> parseMul control enabled (acc + x) y ) (parseFirstNumber $ drop 4 s)
    | control && take 4 s == "do()" = parseMul control True acc $ drop 4 s
    | control && take 7 s == "don't()" = parseMul control False acc $ drop 7 s
    | length s == 0 = acc
    | otherwise = parseMul control enabled acc $ drop 1 s

parseFirstNumber :: String -> (Int, String)
parseFirstNumber s 
    | (and (map isDigit $ take 3 s)) && head (drop 3 s) == ',' 
        = parseSecondNumber (read (take 3 s) :: Int) (drop 4 s)
    | (and (map isDigit $ take 2 s)) && head (drop 2 s) == ',' 
        = parseSecondNumber (read (take 2 s) :: Int) (drop 3 s)
    | (isDigit $ head s) && head (drop 1 s) == ',' 
        = parseSecondNumber (read (take 1 s) :: Int) (drop 2 s)
    | otherwise = (0, drop 1 s)

parseSecondNumber :: Int -> String -> (Int, String)
parseSecondNumber first s 
    | (and (map isDigit $ take 3 s)) && head (drop 3 s) == ')' 
        = (((read (take 3 s) :: Int) * first), (drop 4 s))
    | (and (map isDigit $ take 2 s)) && head (drop 2 s) == ')' 
        = (((read (take 2 s) :: Int) * first), (drop 3 s))
    | (isDigit $ head s) && head (drop 1 s) == ')' 
        = (((read (take 1 s) :: Int) * first), (drop 2 s))
    | otherwise = (0, drop 1 s)