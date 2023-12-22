#!/usr/bin/ruby

# --- Day 3: Binary Diagnostic ---
# --- Part Two ---
# https://adventofcode.com/2021/day/3

@lines = File.readlines('input.txt')

def get_bits_by_binary(binary, lines, position)
  counter = 0
  lines.each do |line|
    unit = (line.chomp.split('').collect(&:to_i)[position] == 0) ? -1 : 1
    counter += unit
  end
  counter.negative? ? (1 - binary) : binary
end

def get_most_bits(lines, position)
  get_bits_by_binary(1, lines, position)
end

def get_least_bits(lines, position)
  get_bits_by_binary(0, lines, position)
end

def filter_by_binary(binary)
  filtered_lines = @lines
  while filtered_lines.length > 1
    filtered_lines[0].chomp.split('').each_with_index do |_, i|
      if binary == 1
        v = get_most_bits(filtered_lines, i)
      else
        v = get_least_bits(filtered_lines, i)
      end
      if filtered_lines.length == 1
        filtered_lines = filtered_lines
      else
        filtered_lines = filtered_lines.select { |l| l[i].to_i == v }
      end
    end
  end
  return filtered_lines[0].chomp
end

oxygen_decimal = filter_by_binary(1).to_i(2)
co2_decimal = filter_by_binary(0).to_i(2)
life_support_decimal = oxygen_decimal * co2_decimal

puts "oxygen generator rating = #{oxygen_decimal}"
puts "CO2 scrubber rating = #{co2_decimal}"
puts "life support rating = #{life_support_decimal}"
