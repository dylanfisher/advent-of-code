#!/usr/bin/env ruby

# Day 6: Tuning Trouble
# Part One
# https://adventofcode.com/2022/day/6

require 'pry'

chars = File.readlines('input.txt').collect(&:chomp).first.split('')

subroutine_start = nil

chars.each_with_index do |char, i|
  next if i < 3

  group = chars[i-3..i]
  if group.uniq.length == 4

    subroutine_start = i + 1
    break
  end
end


puts "subroutine start #{subroutine_start}"
