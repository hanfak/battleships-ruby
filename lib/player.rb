class Player
  attr_reader :players_board

  def initialize(board)
    @players_board = board
  end

  def add(ship, y_coord, x_coord, orientation = :horizontal)
    @players_board.add_to_board(ship, y_coord - 1 , x_coord - 1, orientation)
  end

  def attack(opponent, y_coord, x_coord)
    opponent.change_opponents_board_view(y_coord - 1, x_coord - 1)
  end
end
