require 'player'

describe Player do
  let(:board) { double(:Board, create_board: initial_board) }
  let(:ship) { double(:Ship, size: 1) }
  subject(:player) {described_class.new(board)}

  describe '#initialize' do
    it 'has empty board' do
      expect(player.show_board).to eq initial_board
    end
  end

  describe '#add' do
    it 'adds a ship of size 1 to board' do
      player.add(ship, 2, 3)

      expect(player.show_board).to eq one_ship_on_board
    end
  end

end

def initial_board
  [[0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0]]
end

def one_ship_on_board
  [[0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,1,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0]]
end

def one_ship_on_different_position_on_board
  [[0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,1,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0]]
end
