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

  def default
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
