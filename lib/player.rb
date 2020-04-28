class Player
  attr_reader :name
  attr_accessor :choices, :winner
  def initialize(name)
    @name = name
    @choices = []
    @winner = false
  end
end
