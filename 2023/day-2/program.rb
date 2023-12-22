#!/Users/dylanfisher/.rbenv/shims/ruby

require 'pry'

# --- Day 1: Trebuchet?! ---
# https://adventofcode.com/2023/day/1

num_sets = []

File.readlines('input.txt').each do |line|
  digits = line.scan(/\d/)
  num_arr = []
  num_arr << digits.first
  num_arr << digits.last
  num_sets << num_arr.join.to_i
end

num_sets.reject!(&:nil?)

total = num_sets.sum

puts total
