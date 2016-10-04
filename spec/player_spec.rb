require 'player'

describe Player do
  let(:board) { double(:Board) }
  let(:ship) { double(:Ship) }
  let(:player2) { double(:Player) }
  subject(:player) {described_class.new(board)}

  describe '#players_board' do
    it 'has instance of board' do
      expect(player.players_board).to eq board
    end
  end

  describe '#add' do
    it 'adds a ship to board' do
      expect(board).to receive :add_to_board

      player.add(ship, 4, 2)
    end
  end

  describe '#attack' do
    it "attacks single space on opponent's board" do
      expect(player2).to receive :change_opponents_board_view

      player.attack(player2, 4, 2)
    end
  end
end
