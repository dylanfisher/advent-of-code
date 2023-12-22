#!/usr/bin/env ruby

# Day 9: Smoke Basin
# Part Two
# https://adventofcode.com/2021/day/9

require 'pry'

lines = File.readlines('input.txt')
x_map = lines.collect { |l| l.chomp.split('').collect(&:to_i) }
@x_length = x_map[0].length
y_map = @x_length.times.collect do |i|
  lines.collect { |l| l[i].chomp.to_i }
end
divider = 9

# Horizontal map
@x_basins = []
x_map.each do |row|
  basin = []
  row.each_with_index do |column, column_index|
    if column == divider
      basin << nil
      if (column_index == @x_length - 1)
        @x_basins << basin
      end
    elsif (column != divider) && (column_index != @x_length - 1)
      basin << column
    else
      if (column != divider) && (column_index == @x_length - 1)
        basin << column
      end
      @x_basins << basin
      basin = []
    end
  end
end

basins = []
@x_basins.each_with_index do |row, row_index|
  basin_row = {}
  row.each_with_index do |column, column_index|
    basin_row[column_index] = column if column
  end
  basins << basin_row
end

@intersecting_basins = {}
@total_rows = @x_basins.length

def find_basin(basin_index, row_index, column_index)
  @intersecting_basins[basin_index] ||= {}
  number = @x_basins[row_index][column_index]

  @intersecting_basins[basin_index]["#{row_index},#{column_index}"] = number
  @x_basins[row_index][column_index] = nil

  # Check number above
  if row_index > 0
    number = @x_basins[row_index - 1][column_index]
    if number
      # puts "above"
      find_basin(basin_index, row_index - 1, column_index)
    end
  end

  # Check number below
  if row_index < @total_rows - 1
    number = @x_basins[row_index + 1][column_index]
    if number
      # puts "below"
      find_basin(basin_index, row_index + 1, column_index)
    end
  end

  # Check number to the left
  if column_index > 0
    number = @x_basins[row_index][column_index - 1]
    if number
      # puts "left"
      find_basin(basin_index, row_index, column_index - 1)
    end
  end

  # Check number to the right
  if column_index < @x_length - 1
    number = @x_basins[row_index][column_index + 1]
    if number
      # puts "right"
      find_basin(basin_index, row_index, column_index + 1)
    end
  end
end

@basin_index = 0

def find_basins(basins)
  results = {}

  row_index = @x_basins.find_index { |row| row.any? }
  column_index = @x_basins[row_index].find_index { |x| !x.nil? }
  find_basin(@basin_index, row_index, column_index)
  @basin_index += 1
end

while @x_basins.flatten.any?
  find_basins(@x_basins)
end

@intersecting_basins = @intersecting_basins.sort_by { |_, v| v.length }.reverse
largest_3 = @intersecting_basins.first(3)

multiplied = largest_3.collect { |_, basin| basin.length }.inject(:*)

puts multiplied
