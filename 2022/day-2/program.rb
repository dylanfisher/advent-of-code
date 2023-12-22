#!/usr/bin/env ruby

# Day 2: Rock Paper Scissors
# Part One
# https://adventofcode.com/2022/day/2

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)

shape_score_lookup = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

outcome_score_lookup = {
  loss: 0,
  tie: 3,
  win: 6
}

lookup = {
  'A X' => :tie,
  'B X' => :loss,
  'C X' => :win,
  'A Y' => :win,
  'B Y' => :tie,
  'C Y' => :loss,
  'A Z' => :loss,
  'B Z' => :win,
  'C Z' => :tie
}

total = 0

lines.each do |line|
  line_arr = line.split(' ')
  outcome = lookup[line]
  outcome_score = outcome_score_lookup[outcome]
  shape_score = shape_score_lookup[line_arr.last]

  total += (outcome_score + shape_score)
end

puts "total = #{total}"
