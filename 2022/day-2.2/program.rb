#!/usr/bin/env ruby

# Day 2: Rock Paper Scissors
# Part Two
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
  draw: 3,
  win: 6
}

your_outcome_lookup = {
  'X' => :loss,
  'Y' => :draw,
  'Z' => :win
}

lookup = {
  'A X' => :draw,
  'B X' => :loss,
  'C X' => :win,
  'A Y' => :win,
  'B Y' => :draw,
  'C Y' => :loss,
  'A Z' => :loss,
  'B Z' => :win,
  'C Z' => :draw
}

total = 0

lines.each do |line|
  line_arr = line.split(' ')
  outcome_needed = your_outcome_lookup[line_arr.last]
  outcome = lookup.select { |k, v| k[0] == line_arr[0] && v == outcome_needed }
  outcome_score = outcome_score_lookup[outcome.values.first]
  shape_score = shape_score_lookup[outcome.keys[0].split(' ').last]

  total += (outcome_score + shape_score)
end

puts "total = #{total}"
