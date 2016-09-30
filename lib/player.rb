class Player
  def initialize(board)
    @board = board.create_board
  end

  def show_board
    @board
  end

  def add(ship, y_coord, x_coord)
    @board =[[0,0,0,0,0,0],
            [0,0,0,0,0,0],
            [0,0,0,0,0,0],
            [0,1,0,0,0,0],
            [0,0,0,0,0,0],
            [0,0,0,0,0,0]]
  end
end
