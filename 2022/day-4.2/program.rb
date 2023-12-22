#!/usr/bin/env ruby

# Day 4: Camp Cleanup
# Part Two
# https://adventofcode.com/2022/day/4

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)

groups = lines.collect do |line|
  line.split(',').collect do |range_string|
    range_arr = range_string.split('-').collect(&:to_i)
    Range.new(range_arr[0], range_arr[1])
  end
end

fully_contained = 0

groups.each do |group|
  intersection = group[0].to_a & group[1].to_a

  if intersection.size > 0
    fully_contained += 1
  end
end

puts "fully contained #{fully_contained}"
