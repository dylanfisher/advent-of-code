#!/usr/bin/env ruby

# Day 7: No Space Left On Device
# Part One
# https://adventofcode.com/2022/day/7

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)

MAX_FILE_SIZE = 100000

d = {}
path = []

lines.each do |line|
  if line[0] == '$'
    if line == '$ cd ..'
      path.pop
    elsif line =~ /\$ cd /
      dir = line.match(/\$ cd ([a-z\/]*)/)[1]
      path << dir

      d[path.join('/')] ||= []
    end
  else
    if !line.match(/^dir/)
      d[path.join('/')] << line
    end
  end
end

dir_by_size = {}
d.each do |k, v|
  dir_by_size[k] = v.sum(&:to_i)
end

small_dir_by_size = dir_by_size.select { |k, v| v <= MAX_FILE_SIZE }
small_dir_by_size.transform_keys! { |k| k.split('/').reject { |x| x == '' } }

sub_dir_total = 0

binding.pry

small_dir_by_size.each do |dir_group|
  dir_path = dir_group[0]
  sub_dirs = small_dir_by_size.select { |k, v| k.size > dir_path.size && k & dir_path }
  sub_dir_sum = sub_dirs.values.sum

  sub_dir_total += sub_dir_sum if sub_dir_sum <= MAX_FILE_SIZE
end

total = small_dir_by_size.values.sum + sub_dir_total

puts "total #{total}"
