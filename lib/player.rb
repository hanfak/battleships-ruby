class Player
  attr_reader :players_board

  def initialize(board)
    @players_board = board
  end

  def add(ship, y_coord, x_coord, orientation = :horizontal)
    @players_board.add_to_board(ship, y_coord - 1 , x_coord - 1, orientation)
  end

  def attack(opponent, y_coord, x_coord)
    opponent.players_board.change_opponents_board_view(y_coord - 1, x_coord - 1)
  end

  def view_opponent_board(opponent)
    opponent.players_board.show_hidden_board
  end
end
