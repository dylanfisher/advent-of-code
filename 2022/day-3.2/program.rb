#!/usr/bin/env ruby

# Day 3: Rucksack Reorganization
# Part Two
# https://adventofcode.com/2022/day/3

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)
groups = lines.each_slice(3)

alphabet_array = ('a'..'z').to_a
alphabet_hash = Hash[(1...alphabet_array.size + 1).zip(alphabet_array)]
alphabet_hash.merge! Hash[((alphabet_array.size + 1)...(alphabet_array.size * 2 + 1)).zip(alphabet_array)].transform_values(&:upcase)

total = 0

groups.each do |group|
  intersection = group[0].split('') & group[1].split('') & group[2].split('')
  value = alphabet_hash.key(intersection[0])
  total += value
end

puts "total #{total}"
