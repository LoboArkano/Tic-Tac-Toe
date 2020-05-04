require './lib/game'

describe Game do
  let(:game) { Game.new }
  describe '#in_range?' do
    it 'Return true if input is greater or equal than 1 and less or equal than 9' do
      expect(game.in_range?(5)).to eql(true)
    end
    it 'Return false if input is less than 1 or greater than 9' do
      expect(game.in_range?(10)).to eql(false)
    end
    it 'Return false if input is not a number' do
      expect(game.in_range?('test')).to eql(false)
    end
  end
  describe '#untaken?' do
    let(:opponent_choices) { [2, 5, 7, 9] }
    it 'Return true if the input is not equal to one of the opponent choices' do
      expect(game.untaken?(6, opponent_choices)).to eql(true)
    end
    it 'Return false if the input is equal to one of the opponent choices' do
      expect(game.untaken?(7, opponent_choices)).to eql(false)
    end
  end
end
