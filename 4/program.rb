#!/Users/dylanfisher/.rbenv/shims/ruby

# --- Day 4: Giant Squid ---
# https://adventofcode.com/2021/day/4

require 'pry'

lines = File.readlines('input.txt')
numbers = lines.shift.chomp.split(',').collect(&:to_i)
lines = lines.reject { |l| l == "\n" }
boards = lines.each_slice(5).to_a
@boards = boards.collect do |board|
  board.collect(&:chomp).collect { |row| row.split(' ').collect(&:to_i) }
end

def mark_board(number)
  @boards = @boards.collect do |board|
    board.collect do |row|
      row.collect { |n| n == number ? 'x' : n }
    end
  end
end

def get_winning_board
  @boards.each do |board|
    # Check boards for a horizontal bingo
    board.each do |row|
      return board if row.all? { |n| n == 'x' }
    end

    # Check boards for a vertical bingo
    columns = board.each_with_index.collect do |_, i|
      board.collect { |row| row[i] }
    end

    columns.each do |column|
      return board if columns.all? { |n| n == 'x' }
    end
  end

  return nil
end


# Get the first winning board
winning_boards = []
@winning_number = nil
@last_winning_number = nil

numbers.each do |number|
  mark_board(number)
  won_board = get_winning_board
  if won_board
    if won_board.select { |row| row.all? { |n| n == 'x' }  }.length > 1
      break
    end

    winning_boards << won_board
    @winning_number = number if !@winning_number
    @last_winning_number = number
  end
end

winning_board = winning_boards[0]
last_winning_board = winning_boards[-1]

# binding.pry

# The score of the winning board can now be calculated.
# Start by finding the sum of all unmarked numbers on that board;
# in this case, the sum is 188. Then, multiply that sum by the
# number that was just called when the board won, 24, to get
# the final score, 188 * 24 = 4512.

# Winning board
# [84, 78, 3, 44, 96],
# [59, 86, 70, 80, "x"],
# [93, "x", 52, "x", 61],
# ["x", "x", "x", "x", "x"],
# [5, 25, 6, 85, 99]

def calculate_score(board, number)
  sum = board.flatten.reject { |n| n == 'x' }.sum
  return sum * number
end

puts "First winning board final score = #{calculate_score(winning_board, @winning_number)}"
puts "Last winning board final score = #{calculate_score(last_winning_board, @last_winning_number)}"
