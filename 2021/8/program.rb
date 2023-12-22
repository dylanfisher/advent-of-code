#!/Users/dylanfisher/.rbenv/shims/ruby

# Day 8: Seven Segment Search
# https://adventofcode.com/2021/day/8

require 'pry'

lines = File.readlines('input.txt')
# patterns = lines.collect { |l| l.chomp.split('|')[0] }
outputs = lines.collect { |l| l.chomp.split('|')[1] }
               .collect { |o| o.chomp.split(' ') }
# 0 => 6
# 1 => 2 * unique
# 2 => 5
# 3 => 5
# 4 => 4 * unique
# 5 => 5
# 6 => 6
# 7 => 3 * unique
# 8 => 7 * unique
# 8 => 6

unique_segment_lengths = [2, 4, 3, 7]

unique_digits = outputs.sum do |output|
  output.select { |o| unique_segment_lengths.include?(o.length) }.length
end

puts unique_digits
