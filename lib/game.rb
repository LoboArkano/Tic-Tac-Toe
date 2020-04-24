class Board
  attr_reader :board
  def initialize
    @board = [[' ', '|', ' ', '|', ' '], ['-----'], [' ', '|', ' ', '|', ' '], ['-----'], [' ', '|', ' ', '|', ' ']]
  end

  def example
    @board[0][0] = 'X'
    @board[2][2] = 'X'
    @board[4][4] = 'X'
    @board[2][0] = 'O'
    @board[2][4] = 'O'
    @board
  end

  def instructions
    n = 1
    @board.each do |arr|
      arr.each do |sub_arr|
        if sub_arr == ' '
          sub_arr[' '] = n.to_s
          n += 1
        end
      end
    end
    @board
  end
end

class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @choices = []
  end
end

class Rules
  def initialize; end
end
