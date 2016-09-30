require 'board'

describe Board do
  let(:ship) { double(:Ship, size: 1) }
  subject(:board) {described_class.new}

  describe '#create_board' do
    it 'creates empty array of 6 by 6' do
      expect(board.description).to eq initial_board
    end
  end

  describe '#add_to_board' do
    it 'change the location on board to ship' do
      board.add_to_board(ship, 4, 2)

      expect(board.description[3][1]).to eq ship
      
      # Check other elements have not changed
      board.description.each_with_index do |row,row_index|
        row.each_with_index do |_,col_index|
          unless row_index == 3 && col_index == 1
            expect(board.description[row_index][col_index]).to eq 0
          end
        end
      end
    end

    it 'change the different location on board to ship' do
      board.add_to_board(ship, 2, 5)

      expect(board.description[1][4]).to eq ship

      board.description.each_with_index do |row,row_index|
        row.each_with_index do |_,col_index|
          unless row_index == 1 && col_index == 4
            expect(board.description[row_index][col_index]).to eq 0
          end
        end
      end
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
