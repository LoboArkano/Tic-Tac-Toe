require './lib/board'

describe Board do
  let(:game_board) { Board.new }
  describe '#example' do
    it "Insert 'X' and 'O' in different places" do
      game_board.example
      expect(game_board.board[0][0]).to eql('X')
      expect(game_board.board[2][2]).to eql('X')
      expect(game_board.board[4][4]).to eql('X')
      expect(game_board.board[2][0]).to eql('O')
      expect(game_board.board[2][4]).to eql('O')
    end
  end
end
