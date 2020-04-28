require 'set'

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
