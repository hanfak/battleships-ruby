class Player
  attr_reader :players_board

  def initialize(board)
    @players_board = board
  end

  def add(ship, y_coord, x_coord)
    @players_board.add_to_board(ship, y_coord, x_coord)
  end
end
