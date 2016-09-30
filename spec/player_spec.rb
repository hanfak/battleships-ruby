require 'player'

describe Player do
  let(:board) { double(:Board, create_board: initial_board) }
  subject(:player) {described_class.new(board)}
  it '#initialize' do

    expect(player.get_board).to eq initial_board
  end
end

def initial_board
  return [[0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [0,0,0,0,0,0]]
end
