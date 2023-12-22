#!/usr/bin/ruby

# --- Day 2: Dive! ---
# --- Part Two ---
# https://adventofcode.com/2021/day/2

# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
#   It increases your horizontal position by X units.
#   It increases your depth by your aim multiplied by X.

x = 0
aim = 0
depth = 0

File.readlines('input.txt').each do |line|
  commands = line.split(' ')
  direction = commands[0]
  units = commands[1].to_i

  case direction
  when 'forward'
    x += units
    depth += aim * units
  when 'up'
    aim -= units
  when 'down'
    aim += units
  end
end

puts "x = #{x}"
puts "depth = #{depth}"
puts "total: #{x * depth}"
