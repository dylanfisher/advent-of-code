#!/Users/dylanfisher/.rbenv/shims/ruby

# --- Day 6: Lanternfish ---
# https://adventofcode.com/2021/day/6

require 'pry'

class Fish
  SPAWN_RATE = 7
  SPAWN_RATE_NEWBORN = 9

  attr_accessor :age

  def initialize(age = SPAWN_RATE)
    @age = age
  end

  def get_older!
    @age = SPAWN_RATE if @age == 0
    @age -= 1
  end

  def ready_to_spawn?
    @age == 0
  end
end

class Timeline
  attr_accessor :fishes

  def initialize(days, fishes)
    @days = days
    @fishes = fishes
  end

  def simulate!
    new_fish = []
    @days.times do |i|
      puts "Initial state: #{current_fish}" if i == 0

      fishes.concat(new_fish) if new_fish.any?
      new_fish = []

      fishes.each do |fish|
        fish.get_older!
        if fish.ready_to_spawn?
          new_fish << Fish.new(Fish::SPAWN_RATE_NEWBORN)
        end
      end

      puts "After #{(i + 1).to_s.rjust(2, ' ')} day#{'s' if i > 0}: #{current_fish}"
    end

    current_fish
  end

  def current_fish
    fishes.collect(&:age).join(',')
  end
end

lines = File.readlines('sample.txt')
fish_ages = lines.first.split(',').collect(&:to_i)
starting_fish = fish_ages.collect { |a| Fish.new(a) }

timeline = Timeline.new(80, starting_fish)
timeline.simulate!

puts "Total fish: #{timeline.fishes.length}"
