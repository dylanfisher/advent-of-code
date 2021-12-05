#!/Users/dylanfisher/.rbenv/shims/ruby

# --- Day 4: Giant Squid ---
# --- Part Two ---
# https://adventofcode.com/2021/day/4

class Board
  attr_accessor :lines
  attr_accessor :winning_number
  attr_accessor :index_of_win

  def initialize(lines)
    @lines = parse_lines(lines)
  end

  def parse_lines(lines)
    lines.collect(&:chomp).collect { |row| row.split(' ').collect(&:to_i) }
  end

  def mark!(number)
    @lines = @lines.collect do |row|
      row.collect { |n| n == number ? 'x' : n }
    end
    @winning_number = number if winner?
  end

  def winner?
    winning_rows? || winning_columns?
  end

  def winning_rows?
    @lines.any? { |row| row.all? { |n| n == 'x' } }
  end

  def winning_columns?
    columns.any? do |column|
      column.all? { |n| n == 'x' }
    end
  end

  def columns
    @lines.each_with_index.collect do |_, i|
      @lines.collect { |row| row[i] }
    end
  end

  def score
    sum = lines.flatten.reject { |n| n == 'x' }.sum
    sum * @winning_number
  end
end

lines = File.readlines('input.txt')
numbers = lines.shift.chomp.split(',').collect(&:to_i)
lines = lines.reject { |l| l == "\n" }
@boards = lines.each_slice(5).to_a.collect { |l| Board.new(l) }

numbers.each_with_index do |number, index|
  @boards.each do |board|
    next if board.winner?

    board.mark!(number)
    board.index_of_win = index if board.winner?
  end
end

@boards.sort_by!(&:index_of_win)

winning_board = @boards.first
last_winning_board = @boards.last

# First winning board score: 67716
puts "First winning board final score: #{winning_board.score}"
puts "Last winning board final score: #{last_winning_board.score}"
