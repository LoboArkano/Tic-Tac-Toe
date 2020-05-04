require './lib/game'

describe Game do
  describe '#in_range?' do
    let(:game) { Game.new }
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
end
