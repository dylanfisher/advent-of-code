#!/usr/bin/env ruby

# Day 5: Supply Stacks
# Part Two
# https://adventofcode.com/2022/day/5

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)
sample_stack = {
  1 => 'NZ'.split(''),
  2 => 'DCM'.split(''),
  3 => 'P'.split('')
}
stack = {
  1 => 'SPHVFG'.split(''),
  2 => 'MZDVBFJG'.split(''),
  3 => 'NJLMG'.split(''),
  4 => 'PWDVZGN'.split(''),
  5 => 'BCRV'.split(''),
  6 => 'ZLWPMSRV'.split(''),
  7 => 'PHT'.split(''),
  8 => 'VZHCNSRQ'.split(''),
  9 => 'JQVPGLF'.split('')
}

directions = []

add_to = :stack
lines.each do |line|
  if line == ''
    add_to = :directions
    next
  end

  if add_to == :directions
    directions << line
  end
end

stack_to_use = stack

directions.each do |direction|
  count = direction.match(/^move (\d*)/)[1].to_i
  from = direction.match(/ from (\d*)/)[1].to_i
  to = direction.match(/ to (\d*)/)[1].to_i

  items = stack_to_use[from].shift(count)
  stack_to_use[to].prepend(*items)
end

puts stack_to_use.values.collect(&:first).join
