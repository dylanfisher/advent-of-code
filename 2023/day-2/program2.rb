#!/Users/dylanfisher/.rbenv/shims/ruby

require 'pry'

# --- Day 2: Cube Conundrum ---
# https://adventofcode.com/2023/day/2

RED_COUNT = 12
GREEN_COUNT = 13
BLUE_COUNT = 14

# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

valid = []

File.readlines('input2.txt').each do |line|
  id = line.match(/Game (\d*):/)[1].to_i

  line.sub!(/Game \d*: /, '')

  r = line.scan(/(\d*) red/).flatten.collect(&:to_i).max.to_i
  g = line.scan(/(\d*) green/).flatten.collect(&:to_i).max.to_i
  b = line.scan(/(\d*) blue/).flatten.collect(&:to_i).max.to_i

  valid << [r, g, b].reduce(:*)
end

puts valid.sum
