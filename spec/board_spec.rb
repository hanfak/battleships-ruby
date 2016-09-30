require 'board'

describe Board do
  subject(:board) {described_class.new}

  it '#create_board' do
    expect(board.create_board).to eq initial_board
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
