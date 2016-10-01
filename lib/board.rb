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
    check_ship_fits_on_board(x_coord, ship, description)

    (1..ship.size).each do |amount_of_ship_parts|
      stored_x_coord = x_coord + amount_of_ship_parts - 1

      @description[y_coord][stored_x_coord] = ship
      ship.store_location(y_coord, stored_x_coord)
    end
  end

  # Given starting point places downwards
  def place_vertically(ship, y_coord, x_coord)
    check_ship_fits_on_board(y_coord, ship, description)

    (1..ship.size).each do |amount_of_ship_parts|
      stored_y_coord = y_coord + amount_of_ship_parts - 1

      @description[stored_y_coord][x_coord] = ship
      ship.store_location(stored_y_coord, x_coord)
    end
  end

  def check_ship_fits_on_board(coord = nil, ship, description)
    raise "Out of bounds: starting position should be within game board boundary" if coord + ship.size > description.length
  end
end
