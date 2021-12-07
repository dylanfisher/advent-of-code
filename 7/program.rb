#!/Users/dylanfisher/.rbenv/shims/ruby

# Day 7: The Treachery of Whales
# https://adventofcode.com/2021/day/7

require 'pry'

lines = File.readlines('input.txt')
@positions = lines.first.chomp.split(',').collect(&:to_i).sort

def get_distance(number_to_try)
  @positions.sum do |position|
    (number_to_try - position).abs
  end
end

distances = @positions.each_with_index.collect do |position, index|
  [get_distance(position), index]
end

puts distances.sort[0].inspect
