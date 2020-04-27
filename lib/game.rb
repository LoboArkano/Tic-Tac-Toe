require 'set'

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
  end

  def update_move(choice, sign)
    i = row_position(choice)
    j = column_position(choice)
    @board[i][j] = sign
  end

  def row_position(choice)
    if choice / 3.0 <= 1
      0
    elsif choice / 3.0 <= 2
      2
    else
      4
    end
  end

  def column_position(choice)
    if choice % 3 == 1
      0
    elsif choice % 3 == 2
      2
    else
      4
    end
  end
end

class Player
  attr_reader :name
  attr_accessor :choices
  def initialize(name)
    @name = name
    @choices = []
  end
end

class Rules
  def initialize
    @victory_rows = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
  end

  def in_range?(choice)
    choice.to_i >= 1 && choice.to_i <= 9
  end

  def untaken?(choice, opponent_choices)
    arr = []
    arr.push(choice)
    return false if arr.to_set.subset?(opponent_choices.to_set)

    true
  end

  def previous_choice?(choice, choices)
    !choices.include?(choice)
  end

  def valid_move(choice, choices, opponent_choices)
    in_range?(choice) && untaken?(choice, opponent_choices) && previous_choice?(choice, choices)
  end

  def win_check(choices)
    @victory_rows.each do |victory_row|
      return true if victory_row.to_set.subset?(choices.to_set)
    end
    false
  end

  def draw_check(turn)
    turn > 9
  end
end
