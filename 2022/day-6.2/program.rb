#!/usr/bin/env ruby

# Day 6: Tuning Trouble
# Part Two
# https://adventofcode.com/2022/day/6

require 'pry'

chars = File.readlines('input.txt').collect(&:chomp).first.split('')

message_start = nil

chars.each_with_index do |char, i|
  next if i < 14

  group = chars[i-14..i]
  if group.uniq.length == 14

    message_start = i + 1
    break
  end
end

puts "message start #{message_start}"
