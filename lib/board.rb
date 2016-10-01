class Board
  attr_reader :description

  def initialize(y_initial = 6, x_initial = 6)
    @description = Array.new(y_initial) { Array.new(x_initial, 0) }
  end

  def add_to_board(ship, y_coord, x_coord, orientation)
    place_horizontally(ship, y_coord, x_coord) if orientation == :horizontal
    place_vertically(ship, y_coord, x_coord) if orientation == :vertical
  end

  private
  # given starting point places to the right
  def place_horizontally(ship, y_coord, x_coord)
    (1..ship.size).each do |amount_of_ship_parts|
      @description[y_coord - 1][x_coord + amount_of_ship_parts - 2] = ship
      ship.store_location(y_coord, x_coord)
    end
  end

  # Given starting point places downwards
  def place_vertically(ship, y_coord, x_coord)
    (1..ship.size).each do |amount_of_ship_parts|
      @description[y_coord + amount_of_ship_parts - 2][x_coord  - 1] = ship
      ship.store_location(y_coord, x_coord)
    end
  end
end
