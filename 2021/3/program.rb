#!/usr/bin/ruby

# --- Day 3: Binary Diagnostic ---
# https://adventofcode.com/2021/day/3

lines = File.readlines('input.txt')
binary_count = {}

lines.each do |line|
  line.chomp.split('').collect(&:to_i).each_with_index do |value, index|
    unit = value == 0 ? -1 : 1
    binary_count[index] = binary_count[index].to_i + unit
  end
end

binary_count = binary_count.values.collect { |v| v.negative? ? 0 : 1 }
gamma_rate = binary_count.join
epsilon_rate = binary_count.collect { |v| 1 - v }.join
gamma_rate_decimal = gamma_rate.to_i(2)
epsilon_rate_decimal = epsilon_rate.to_i(2)

puts "gamma rate   = #{gamma_rate} / #{gamma_rate_decimal}"
puts "epsilon rate = #{epsilon_rate} / #{epsilon_rate_decimal}"
puts "total = #{gamma_rate_decimal * epsilon_rate_decimal}"
