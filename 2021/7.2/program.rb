#!/Users/dylanfisher/.rbenv/shims/ruby

# Day 7: The Treachery of Whales
# --- Part Two ---
# https://adventofcode.com/2021/day/7

require 'pry'

lines = File.readlines('input.txt')
@positions = lines.first.chomp.split(',').collect(&:to_i).sort
@max_number = @positions[-1]

def get_distance(number_to_try)
  puts "#{number_to_try.to_f / @max_number.to_f * 100}%"
  @positions.sum do |position|
    distance = (number_to_try - position).abs
    (0..distance - 1).sum { |d| d + 1 }
  end
end

distances = (@positions[0]..@positions[-1]).to_a.collect do |position|
  get_distance(position)
end

puts distances.sort[0].inspect
