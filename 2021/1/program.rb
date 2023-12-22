#!/usr/bin/ruby

# --- Day 1: Sonar Sweep ---
# https://adventofcode.com/2021/day/1

times_increased = 0
last_depth = nil

File.readlines('input.txt').each do |line|
  current_depth = line.to_i

  if last_depth && (current_depth > last_depth)
    times_increased += 1
  end

  last_depth = current_depth
end

puts times_increased
