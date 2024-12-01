module Main where

import System.Environment

import Day1
import Day2
import Day3
import Day4
import Day5
import Day6
import Day7
import Day8
import Day9
import Day10
import Day11
import Day12
import Day13
import Day14
import Day15
import Day16
import Day17
import Day18
import Day19
import Day20
import Day21
import Day22
import Day23
import Day24
import Day25

main :: IO ()
main = do 
    a <- getArgs
    case (head a) of 
        "1.1" -> Day1.day1part1
        "1.2" -> Day1.day1part2
        "2.1" -> Day2.day2part1
        "2.2" -> Day2.day2part2
        "3.1" -> Day3.day3part1
        "3.2" -> Day3.day3part2
        "4.1" -> Day4.day4part1
        "4.2" -> Day4.day4part2
        "5.1" -> Day5.day5part1
        "5.2" -> Day5.day5part2
        "6.1" -> Day6.day6part1
        "6.2" -> Day6.day6part2
        "7.1" -> Day7.day7part1
        "7.2" -> Day7.day7part2
        "8.1" -> Day8.day8part1
        "8.2" -> Day8.day8part2
        "9.1" -> Day9.day9part1
        "9.2" -> Day9.day9part2
        "10.1" -> Day10.day10part1
        "10.2" -> Day10.day10part2
        "11.1" -> Day11.day11part1
        "11.2" -> Day11.day11part2
        "12.1" -> Day12.day12part1
        "12.2" -> Day12.day12part2
        "13.1" -> Day13.day13part1
        "13.2" -> Day13.day13part2
        "14.1" -> Day14.day14part1
        "14.2" -> Day14.day14part2
        "15.1" -> Day15.day15part1
        "15.2" -> Day15.day15part2
        "16.1" -> Day16.day16part1
        "16.2" -> Day16.day16part2
        "17.1" -> Day17.day17part1
        "17.2" -> Day17.day17part2
        "18.1" -> Day18.day18part1
        "18.2" -> Day18.day18part2
        "19.1" -> Day19.day19part1
        "19.2" -> Day19.day19part2
        "20.1" -> Day20.day20part1
        "20.2" -> Day20.day20part2
        "21.1" -> Day21.day21part1
        "21.2" -> Day21.day21part2
        "22.1" -> Day22.day22part1
        "22.2" -> Day22.day22part2
        "23.1" -> Day23.day23part1
        "23.2" -> Day23.day23part2
        "24.1" -> Day24.day24part1
        "24.2" -> Day24.day24part2
        "25.1" -> Day25.day25part1
        "25.2" -> Day25.day25part2
        _ -> print "Not implemented"
