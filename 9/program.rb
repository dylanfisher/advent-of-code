#!/Users/dylanfisher/.rbenv/shims/ruby

# Day 9: Smoke Basin
# https://adventofcode.com/2021/day/9

require 'pry'

lines = File.readlines('input.txt')
x_map = lines.collect { |l| l.chomp.split('').collect(&:to_i) }
x_length = x_map[0].length
y_map = x_length.times.collect do |i|
  lines.collect { |l| l[i].chomp.to_i }
end

# Horizontal map
x_map.each do |row|
  last_height = nil
  row.each_with_index do |column, column_index|
    if last_height && column < last_height
      row[column_index - 1] = nil
    elsif last_height
      row[column_index] = nil
    end
    last_height = column
  end
end

# Vertical map
y_map.each do |row|
  last_height = nil
  row.each_with_index do |column, column_index|
    if last_height && column < last_height
      row[column_index - 1] = nil
    elsif last_height
      row[column_index] = nil
    end
    last_height = column
  end
end

# Combine horizontal and vertical maps
y_map.each_with_index do |column, column_index|
  column.each_with_index do |row, row_index|
    x_map[row_index][column_index] = row if row.nil?
  end
end

lowest_heights = x_map.flatten.select { |n| n }
sum = lowest_heights.sum + lowest_heights.length

puts "Sum is: #{sum}"
