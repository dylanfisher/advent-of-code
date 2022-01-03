#!/usr/bin/env ruby

# Day 11: Dumbo Octopus
# https://adventofcode.com/2021/day/11

require 'pry'

@lines = File.readlines('input.txt').collect { |l| l.chomp.split('').collect(&:to_i) }
@steps = 100
@y_length = @lines.length
@x_length = @lines[0].length
@flash_count = 0

def flash(y, x)
  return if @flashes[y][x] > 0

  @flashes[y][x] = 1
  @flash_count += 1

  increase(y - 1, x - 1) if (y > 0 && x > 0)                         # Top left
  increase(y - 1, x)     if (y > 0)                                  # Top center
  increase(y - 1, x + 1) if (y > 0 && x < @x_length - 1)             # Top right
  increase(y, x + 1)     if (x < @x_length - 1)                      # Right
  increase(y + 1, x + 1) if (y < @y_length - 1 && x < @x_length - 1) # Bottom right
  increase(y + 1, x)     if (y < @y_length - 1)                      # Bottom center
  increase(y + 1, x - 1) if (y < @y_length - 1 && x > 0)             # Bottom left
  increase(y, x - 1)     if (x > 0)                                  # Left
end

def increase(y, x)
  @lines[y][x] += 1
  if @lines[y][x] > 9
    flash(y, x)
  end
end

@steps.times do |step_count|
  @step_count = step_count
  @flashes = @y_length.times.collect { @x_length.times.collect { 0 } }
  @lines.each_with_index do |row, y|
    row.each_with_index do |col, x|
      increase(y, x)
    end
  end

  @lines.each_with_index do |row, y|
    row.each_with_index do |col, x|
      @lines[y][x] = 0 if @lines[y][x] > 9
    end
  end
end

@lines.each { |l| puts l.join }

puts ""
puts "#{@flash_count} flashes"
