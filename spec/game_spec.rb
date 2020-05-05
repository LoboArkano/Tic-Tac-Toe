require './lib/game'
require './lib/board'
require './lib/player'

describe Game do
  let(:game) { Game.new }
  let(:game_board) { Board.new }
  let(:player) { Player.new('GTO') }
  let(:player2) { Player.new('RS') }
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
  describe '#previous_choice?' do
    let(:previous_choice) { [1, 3, 6, 8] }
    it 'Return true if the input is not equal to one of the user previous choices' do
      expect(game.previous_choice?(4, previous_choice)).to eql(true)
    end
    it 'Return false if the input is equal to one of the user previous choices' do
      expect(game.previous_choice?(6, previous_choice)).to eql(false)
    end
  end
  describe '#valid_move' do
    let(:previous_choice) { [4, 5, 8, 9] }
    let(:opponent_choices) { [2, 3, 6, 7] }
    it 'Return true if all the methods return true' do
      expect(game.valid_move(1, previous_choice, opponent_choices)).to eql(true)
    end
    it 'Return false if one of the methods return false' do
      expect(game.valid_move(10, previous_choice, opponent_choices)).to eql(false)
    end
  end
  describe '#update_game' do
    let(:board) { game_board.board }
    it 'Update the board with the user move' do
      expect { game_board.update_move(3, 'X') }.to change(game_board, :board)
    end
    it 'turn variable increment his value by one' do
      expect { game.update_game(player, game_board, 'X') }.to change(game, :turn).by(1)
    end
  end
  describe '#win_check' do
    let(:choices) { [1, 2, 3] }
    let(:choices2) { [1, 3, 8] }
    it 'Return true if a victory_row is a subset of choices' do
      expect(game.win_check(choices)).to eql(true)
    end
    it 'Return false if any victory_row is a subset of choices' do
      expect(game.win_check(choices2)).to eql(false)
    end
  end
  describe '#game_over' do
    it 'Change the value of end_game to true' do
      game.game_over(player)
      expect(game.end_game).to be true
    end
    it 'Change the value of victory to true' do
      game.game_over(player)
      expect(game.victory).to be true
    end
    it 'Change the value of winner to true' do
      game.game_over(player)
      expect(player.winner).to be true
    end
  end
  describe '#draw_check' do
    it 'Change the value of end_game to true if turn is greater than 9' do
      game.turn = 10
      game.draw_check
      expect(game.end_game).to be true
    end
    it 'end_game is false if turn is less than 9' do
      game.turn = 5
      game.draw_check
      expect(game.end_game).to be false
    end
  end
  describe '#who_win?' do
    it "Return the player's name (GTO) when win the match" do
      player.winner = true
      expect(game.who_win?(player, player2)).to eql('GTO')
    end
    it "Return the player's name (RS) when win the match" do
      player2.winner = true
      expect(game.who_win?(player, player2)).to eql('RS')
    end
  end
end
