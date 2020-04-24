class Board
  attr_reader :board
  def initialize
    @board = [[' ', '|', ' ', '|', ' '], ['-----'], [' ', '|', ' ', '|', ' '], ['-----'], [' ', '|', ' ', '|', ' ']]
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
