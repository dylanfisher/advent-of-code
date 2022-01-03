#!/usr/bin/env ruby

# Day 10: Syntax Scoring
# Part 2
# https://adventofcode.com/2021/day/10

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)
closing_pattern = Regexp.union([')', ']', '}', '>'])
matching_pattern = Regexp.union(['()', '[]', '{}', '<>'])
tags = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}
score = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4
}

lines.collect do |line|
  while line.match(matching_pattern)
    line.gsub!(matching_pattern, '')
  end
end

# Remove corrupted lines
lines.delete_if { |line| line.match(closing_pattern) }

# Fix incomplete lines
completed_lines = lines.collect do |line|
  line.reverse.split('').collect { |x| tags[x] }.join
end

completed_line_scores = completed_lines.collect do |line|
  line_score = 0
  line.split('').each { |x| line_score = ((line_score * 5) + score[x]) }
  line_score
end

completed_line_scores.sort!

middle_score = completed_line_scores[(completed_line_scores.length - 1) / 2]

puts middle_score
