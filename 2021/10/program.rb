#!/usr/bin/env ruby

# Day 10: Syntax Scoring
# https://adventofcode.com/2021/day/10

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)
closing_pattern = Regexp.union([')', ']', '}', '>'])
matching_pattern = Regexp.union(['()', '[]', '{}', '<>'])
score = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137
}

lines.collect do |line|
  while line.match(matching_pattern)
    line.gsub!(matching_pattern, '')
  end
end

corrupted_lines = lines.select { |line| line.match(closing_pattern) }
corrupted_line_tags = corrupted_lines.collect { |line| line.match(closing_pattern)[0] }
total_score = corrupted_line_tags.sum { |tag| score[tag] }

puts total_score
