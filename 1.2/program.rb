#!/usr/bin/ruby

# --- Day 1: Sonar Sweep ---
# --- Part Two ---
# https://adventofcode.com/2021/day/1

times_increased = 0
last_depth = nil
lines = File.readlines('input.txt')

lines.each_with_index do |line, i|
  line_group = lines[i..i+2]

  next if line_group.length < 3

  current_depth = line_group.collect(&:to_i).sum

  if last_depth && (current_depth > last_depth)
    times_increased += 1
  end

  last_depth = current_depth
end

puts times_increased
