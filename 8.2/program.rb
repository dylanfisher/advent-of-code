#!/Users/dylanfisher/.rbenv/shims/ruby

# Day 8: Seven Segment Search
# https://adventofcode.com/2021/day/8

require 'pry'

lines = File.readlines('input.txt')
unique_segments = {
  1 => 2,
  4 => 4,
  7 => 3,
  8 => 7
}
unique_segment_lengths = unique_segments.values
total_decoded_digits = []

lines.collect do |line|
  mapping = {}
  patterns = line.chomp.split('|')[0].chomp.split(' ')
  outputs = line.chomp.split('|')[1].chomp.split(' ')

  patterns.each do |pattern|
    # Assign unique segments
    unique_segment = unique_segments.key(pattern.length) if unique_segment_lengths.include?(pattern.length)
    mapping[unique_segment] = pattern if unique_segment
  end

  patterns.each do |pattern|
    case pattern.length
    when 6
      if mapping[4].count(pattern) == 4
        mapping[9] = pattern
      elsif mapping[1].count(pattern) < 2
        mapping[6] = pattern
      else
        mapping[0] = pattern
      end
    when 5
      if mapping[1].count(pattern) == 2
        mapping[3] = pattern
      elsif mapping[4].count(pattern) == 3
        mapping[5] = pattern
      else
        mapping[2] = pattern
      end
    end
  end

  # Sort the mapping
  mapping = mapping.sort.to_h

  decoded_digits = outputs.collect do |o|
    mapping.select { |k, v| (o.count(v) == o.length) && (o.length == v.length) }
  end

  decoded_digits = decoded_digits.collect(&:keys).join.to_i

  total_decoded_digits << decoded_digits
  puts decoded_digits
end

puts "Total sum: #{total_decoded_digits.sum}"
