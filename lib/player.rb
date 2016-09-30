class Player
  def initialize(board)
    @board = board.create_board
  end

  def show_board
    @board
  end

  def add(ship, y_coord, x_coord)
    @board[y_coord - 1][x_coord - 1] = ship.size
  end
end
