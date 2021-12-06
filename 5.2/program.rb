#!/Users/dylanfisher/.rbenv/shims/ruby

# --- Day 5: Hydrothermal Venture ---
# --- Part Two ---
# https://adventofcode.com/2021/day/5

require 'pry'

class Grid
  attr_accessor :diagram

  def initialize(coordinates)
    @coordinates = coordinates
    @diagram = create_diagram
    plot_coordinates!
  end

  def x_values
    @x_values ||= @coordinates.collect { |k| [k[:x1], k[:x2]] }.flatten
  end

  def min_x
    @min_x ||= x_values.min
  end

  def max_x
    @max_x ||= x_values.max
  end

  def y_values
    @y_values ||= @coordinates.collect { |k| [k[:y1], k[:y2]] }.flatten
  end

  def min_y
    @min_y ||= y_values.min
  end

  def max_y
    @max_y ||= y_values.max
  end

  def x_index_offset
    min_x
  end

  def y_index_offset
    min_y
  end

  def create_diagram
    rows = []
    (min_y..max_y).each do
      column = []
      (min_x..max_x).each { |v| column << { v => 0 } }
      rows << column
    end
    rows
  end

  def plot_coordinates!
    @coordinates.each_with_index do |c, index|
      puts "plotting coordinates #{c.inspect}"

      if horizontal?(c)
        # Sort the coordinate to always ascend by y value
        if c[:y1] > c[:y2]
          y1 = c[:y1]
          x1 = c[:x1]
          c[:y1] = c[:y2]
          c[:y2] = y1
          c[:x1] = c[:x2]
          c[:x2] = x1
        end

        x_unit = c[:x1] > c[:x2] ? -1 : 1
        # y_unit = c[:y1] > c[:y2] ? -1 : 1
        # Starting coordinates
        # sc_y = y_unit == 1 ? [c[:x2], c[:y1]] : [c[:x1], c[:y2]]
        # sc_x = x_unit == 1 ? [c[:x2], c[:y1]] : [c[:x1], c[:y2]]

        range_y = [c[:y1], c[:y2]].sort
        # range_x = [c[:x1], c[:x2]].sort
        range_y_length = (range_y[0]..range_y[1]).to_a.length
        range_y_length.times do |i|
          # binding.pry if index == 5
          row = diagram[c[:y1] + i]
          x_iterator = (c[:x1] + (i * x_unit))
          # binding.pry if x_iterator == 0
          column = row[x_iterator]
          # binding.pry if column.nil?
          column[x_iterator] = column[x_iterator] += 1
        end
      else
        coordinate_y_range(c).each do |y_index|
          row = diagram[y_index - y_index_offset]
          coordinate_x_range(c).each do |x_index|
            h = row.find { |h| h.keys[0] == x_index }
            h[x_index] = h[x_index] += 1
          end
        end
      end
    end
  end

  def coordinate_y_range(c)
    y_range = [c[:y1], c[:y2]].sort
    (y_range[0]..y_range[1]).to_a
  end

  def coordinate_x_range(c)
    x_range = [c[:x1], c[:x2]].sort
    (x_range[0]..x_range[1]).to_a
  end

  def horizontal?(c)
    (c[:x1] != c[:x2]) && (c[:y1] != c[:y2])
  end

  def overlapping_points(min_overlap = 2)
    diagram.flatten.collect(&:values).flatten.select { |v| v >= min_overlap }
  end
end

lines = File.readlines('sample.txt')
points = lines.collect do |line|
  parts = line.chomp.split(' -> ').collect { |x| x.split(',').collect(&:to_i) }
  {
    x1: parts[0][0],
    y1: parts[0][1],
    x2: parts[1][0],
    y2: parts[1][1]
   }
end

grid = Grid.new(points)
# puts grid.diagram.inspect
# binding.pry

# Overlapping points in part 1: 7674
puts "Overlapping points: #{grid.overlapping_points.length}"
