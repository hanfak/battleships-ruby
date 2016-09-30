require 'board'

describe Board do
  let(:ship) { double(:Ship, size: 1, store_location: :value) }
  let(:ship1) { double(:Ship, size: 2, store_location: :value) }
  let(:ship2) { double(:Ship, size: 4, store_location: :value) }
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

    it 'change the location on board to ship' do
      board.add_to_board(ship1, 1, 1)

      expect(board.description[0][0]).to eq ship1
      expect(board.description[0][1]).to eq ship1

      # Check other elements have not changed
      board.description.each_with_index do |row,row_index|
        row.each_with_index do |_,col_index|
          unless (row_index == 0 && col_index == 0) || (row_index == 0 && col_index == 1)
            expect(board.description[row_index][col_index]).to eq 0
          end
        end
      end
    end

    it 'stores where the ship is placed on the board' do
        board.add_to_board(ship2, 1, 1)
        expect(ship2).to have_received(:store_location).exactly(4).times
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
