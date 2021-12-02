#!/usr/bin/ruby

# --- Day 2: Dive! ---
# https://adventofcode.com/2021/day/2

# forward X increases the horizontal position by X units.
# down X increases the depth by X units.
# up X decreases the depth by X units.

x = 0
y = 0

File.readlines('input.txt').each do |line|
  commands = line.split(' ')
  direction = commands[0]
  units = commands[1].to_i

  case direction
  when 'forward'
    x += units
  when 'up'
    y -= units
  when 'down'
    y += units
  end
end

puts "x = #{x}"
puts "y = #{y}"
puts "total: #{x * y}"
