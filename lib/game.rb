require 'set'
require './lib/player'
require './lib/board'

class Game
  attr_accessor :victory, :turn, :end_game
  def initialize
    @victory_rows = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
    @victory = false
    @end_game = false
    @turn = 1
  end

  def in_range?(choice)
    choice.to_i >= 1 && choice.to_i <= 9
  end

  def untaken?(choice, opponent_choices)
    return false if opponent_choices.include?(choice)

    true
  end

  def previous_choice?(choice, choices)
    !choices.include?(choice)
  end

  def valid_move(choice, choices, opponent_choices)
    in_range?(choice) && untaken?(choice, opponent_choices) && previous_choice?(choice, choices)
  end

  def update_game(player, game_board, sign)
    game_board.update_move(player.choices[-1].to_i, sign)
    @turn += 1
  end

  def win_check(choices)
    @victory_rows.each do |victory_row|
      return true if victory_row.to_set.subset?(choices.to_set)
    end
    false
  end

  def game_over(player)
    @end_game = true
    @victory = true
    player.winner = true
  end

  def draw_check
    @end_game = true if @turn > 9
  end

  def who_win?(player1, player2)
    player1.winner ? player1.name : player2.name
  end

  def check_restart(player1, player2)
    restart_game(player1, player2)
  end

  private

  def restart_game(player1, player2)
    @end_game = false
    @turn = 1
    @victory = false
    player1.choices = []
    player2.choices = []
  end
end
