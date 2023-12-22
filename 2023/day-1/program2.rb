#!/Users/dylanfisher/.rbenv/shims/ruby

require 'pry'

# --- Day 1: Trebuchet?! ---
# https://adventofcode.com/2023/day/1

num_sets = []
dict = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}

File.readlines('input2.txt').each do |line|
  digits = line.scan(/(?=(#{dict.keys.join('|')}|\d))/)
  num_arr = []
  first = digits.first.first
  last = digits.last.first
  num_arr << (first.to_i == 0 ? dict[first] : first.to_i)
  num_arr << (last.to_i == 0 ? dict[last] : last.to_i)
  num_sets << num_arr.join.to_i
end

num_sets.reject!(&:nil?)

total = num_sets.sum

puts total
