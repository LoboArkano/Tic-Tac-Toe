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
end

class Player
  def initialize(name, choices)
    @name = name
    @choices = choices
  end
end

class Rules
  def initialize; end
end
