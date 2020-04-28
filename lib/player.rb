class Player
  attr_reader :name
  attr_accessor :choices
  def initialize(name)
    @name = name
    @choices = []
  end
end
