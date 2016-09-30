class Board
  attr_reader :description

  def initialize
    @description = [[0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0]]
  end

  def add_to_board(ship, y_coord, x_coord)
    @description[y_coord - 1][x_coord - 1] = ship
  end
end
