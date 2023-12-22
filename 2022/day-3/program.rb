#!/usr/bin/env ruby

# Day 3: Rucksack Reorganization
# Part One
# https://adventofcode.com/2022/day/3

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)

alphabet_array = ('a'..'z').to_a
alphabet_hash = Hash[(1...alphabet_array.size + 1).zip(alphabet_array)]
alphabet_hash.merge! Hash[((alphabet_array.size + 1)...(alphabet_array.size * 2 + 1)).zip(alphabet_array)].transform_values(&:upcase)

total = 0

lines.each do |line|
  group_1 = line[0..(line.length/2 - 1)].split('')
  group_2 = line[(line.length/2)..].split('')
  intersection = (group_1 & group_2)[0]
  value = alphabet_hash.key(intersection)

  total += value
end

puts "total #{total}"
