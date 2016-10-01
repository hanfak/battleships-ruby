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
    it 'change single location on board to place a ship' do
      board.add_to_board(ship, 4, 2, :horizontal)

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

    it 'change single different location on board to place a ship' do
      board.add_to_board(ship, 2, 5, :horizontal)

      expect(board.description[1][4]).to eq ship

      board.description.each_with_index do |row,row_index|
        row.each_with_index do |_,col_index|
          unless row_index == 1 && col_index == 4
            expect(board.description[row_index][col_index]).to eq 0
          end
        end
      end
    end

    it 'change several location in row on board to place a ship' do
      board.add_to_board(ship1, 1, 1, :horizontal)

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
        board.add_to_board(ship2, 1, 1, :horizontal)
        expect(ship2).to have_received(:store_location).exactly(4).times
    end

    it 'change several locations in column on board to place a ship' do
      board.add_to_board(ship2, 3, 3, :vertical)

      expect(board.description[2][2]).to eq ship2
      expect(board.description[3][2]).to eq ship2
      expect(board.description[4][2]).to eq ship2
      expect(board.description[5][2]).to eq ship2

      # Check other elements have not changed
      board.description.each_with_index do |row,row_index|
        row.each_with_index do |_,col_index|
          unless (row_index == 2 && col_index == 2) ||
                 (row_index == 3 && col_index == 2) ||
                 (row_index == 4 && col_index == 2) ||
                 (row_index == 5 && col_index == 2)
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
