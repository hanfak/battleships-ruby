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
    # place ship object in the number of adjacent columns in same row, up to the size of the ship
    (1..ship.size).each do |number_ship_parts|
      @description[y_coord - 1][x_coord + number_ship_parts - 2] = ship
      ship.store_location(y_coord, x_coord)
    end
  end
end
