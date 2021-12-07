#!/Users/dylanfisher/.rbenv/shims/ruby

# --- Day 6: Lanternfish ---
# https://adventofcode.com/2021/day/6

require 'pry'

spawn_rate = 7
spawn_rate_new = 9
days = 256

lines = File.readlines('input.txt')
numbers = lines.first.chomp.split(',').collect(&:to_i)
table = {}

spawn_rate_new.times { |i| table[i] = 0 }
numbers.each { |n| table[n] += 1 }

additions = 0

days.times do
  puts table.inspect
  new_table = {}
  spawn_rate_new.times { |i| new_table[i] = 0 }
  table.each do |timer, count|
    if timer.zero?
      additions = count
    else
      new_table[timer - 1] = count
    end
  end
  new_table[spawn_rate - 1] = (new_table[spawn_rate - 1] + additions)
  new_table[spawn_rate_new - 1] = additions
  table = new_table
end

# Part 2 total fish: 1689540415957
puts table.values.sum
