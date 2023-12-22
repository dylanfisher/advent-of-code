#!/Users/dylanfisher/.rbenv/shims/ruby

require 'pry'

# --- Day 2: Cube Conundrum ---
# https://adventofcode.com/2023/day/2

RED_COUNT = 12
GREEN_COUNT = 13
BLUE_COUNT = 14

# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

valid = []

File.readlines('input.txt').each do |line|
  id = line.match(/Game (\d*):/)[1].to_i
  red = line.scan(/(\d*) red/).flatten.collect(&:to_i).max.to_i
  green = line.scan(/(\d*) green/).flatten.collect(&:to_i).max.to_i
  blue = line.scan(/(\d*) blue/).flatten.collect(&:to_i).max.to_i

  next if red > RED_COUNT || green > GREEN_COUNT || blue > BLUE_COUNT

  valid << id
end

puts valid.sum
