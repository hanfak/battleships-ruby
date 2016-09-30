require 'player'

describe Player do
  let(:board) { double(:Board, create_board: initial_board) }
  let(:ship) { double(:Ship, size: 1) }
  subject(:player) {described_class.new(board)}

  describe '#players_board' do
    it 'has instance of board' do
      expect(player.players_board).to eq board
    end
  end

  describe '#add' do
    it 'adds a ship of size 1 to board' do
      expect(board).to receive :add_to_board

      player.add(ship, 4, 2)
    end
  end
end
