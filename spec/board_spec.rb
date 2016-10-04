require 'board'

describe Board do
  let(:ship)  { double(:Ship, size: 1, store_location: :value) }
  let(:ship1) { double(:Ship, size: 2, store_location: :value) }
  let(:ship2) { double(:Ship, size: 4, store_location: :value) }
  let(:ship3) { double(:Ship, size: 3, store_location: :value) }
  let(:ship4) { double(:Ship, size: 4, store_location: :value) }
  subject(:board) {described_class.new}

  describe '#create_board' do
    it 'creates empty array of 6 by 6' do
      expect(board.description).to eq initial_board
    end
  end

  describe '#add_to_board' do
    it 'places single size ship on board' do
      board.add_to_board(ship, 3, 1, :horizontal)

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

    context 'horizontal placement of ship' do
      it 'change single different location on board to place a ship' do
        board.add_to_board(ship, 1, 4, :horizontal)

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
        board.add_to_board(ship1, 0, 0, :horizontal)

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
    end

    it 'stores where the ship is placed on the board' do
        board.add_to_board(ship2, 1, 1, :horizontal)
        expect(ship2).to have_received(:store_location).exactly(4).times
    end

    context 'vertical placement' do
      it 'change several locations in column on board to place a ship' do
        board.add_to_board(ship2, 2, 2, :vertical)

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

    context 'ship placed out of board range error' do
      it 'vertical case' do
        error_message = "Out of bounds: starting position should be within game board boundary"
        expect{board.add_to_board(ship2, 5, 5, :vertical)}.to raise_error error_message
      end

      it 'horizontal case' do
        error_message = "Out of bounds: starting position should be within game board boundary"
        expect{board.add_to_board(ship2, 5, 5, :horizontal)}.to raise_error error_message
      end

      it 'shipped placed outside of board' do
        error_message = "Out of bounds: starting position should be within game board boundary"
        expect{board.add_to_board(ship2, 10, 5, :horizontal)}.to raise_error error_message
      end
    end

    context 'ship already exists in place error' do
      it 'horizontal case' do
        board.add_to_board(ship2, 2, 2, :vertical)

        message = "Ship already there: Choose another position so not overlap with a ship in that place"
        expect{ board.add_to_board(ship3, 5, 1, :horizontal) }.to raise_error message
      end

      it 'vertical case' do
        board.add_to_board(ship4, 2, 2, :horizontal)

        message = "Ship already there: Choose another position so not overlap with a ship in that place"
        expect{ board.add_to_board(ship3, 0, 3, :vertical) }.to raise_error message
      end

      it 'deletes parts ship already laid down horizontal case' do
        board.add_to_board(ship2, 2, 2, :vertical)
        begin
          board.add_to_board(ship3, 5, 1, :horizontal)
        rescue
          expect(board.description[5][1]).to eq 0
          expect(board.description[5][2]).to eq ship2
          expect(board.description[5][3]).to eq 0
        end
      end

      it 'deletes parts ship already laid down vertical case' do
        board.add_to_board(ship4, 2, 2, :horizontal)
        begin
          board.add_to_board(ship3, 0, 3, :vertical)
        rescue
          expect(board.description[0][3]).to eq 0
          expect(board.description[1][3]).to eq 0
          expect(board.description[2][3]).to eq ship4
        end
      end
    end
  end

  describe '#change_opponents_board_view' do
    it 'responds to method' do
      expect(board).to respond_to :change_opponents_board_view
    end

    it 'hits ships' do
      allow(board).to receive(:description).and_return(game_1_board)

      expect(board.change_opponents_board_view(0,0)).to eq :hit
    end

    it 'miss ships' do
      allow(board).to receive(:description).and_return(game_1_board)

      expect(board.change_opponents_board_view(4,2)).to eq :miss
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

def game_1_board
  [[ship,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0]]
end
