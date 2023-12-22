#!/usr/bin/env ruby

# Day 12: Passage Pathing
# https://adventofcode.com/2021/day/12

require 'pry'

@points = File.readlines('sample.txt').collect { |l| l.chomp.split('-') }.sort_by { |k| k == 'start' ? 0 : k }
@starts = @points.select { |x| x[0] == 'start' }
@ends = @points.select { |x| x[1] == 'end' }
@paths = 0

@starts.each do |point|
  current_path = [point[0]]
  next_points = @points.select { |x| x[0] == point[1] }

  while next_points.any?
    next_points.each do |next_point|
      if current_path[-1] != next_point[0]
        current_path << next_point[1]
        if next_point[1] == 'end'
          @paths += 1
          next
        end
      end
    end

    binding.pry
  end

  puts current_path.inspect
end

# binding.pry
