class Board
  attr_reader :description

  SEA = 0

  def initialize(y_initial = 6, x_initial = 6)
    @description = Array.new(y_initial) { Array.new(x_initial, SEA) }
    @ships = []
  end

  def add_to_board(ship, y_coord, x_coord, orientation)
    place_horizontally(ship, y_coord, x_coord) if orientation == :horizontal
    place_vertically(ship, y_coord, x_coord) if orientation == :vertical
    # place_by_orientation(orientation,ship, y_coord, x_coord)
    @ships << ship
  end

  def change_opponents_board_view(y_coord, x_coord)
    ship = description[y_coord][x_coord]
    return missed_ship(y_coord, x_coord) if ship == SEA
    ship.change_status(y_coord, x_coord)
    all_ships_sunk? ? :won : ship.hit_or_sunk
  end

  def show_hidden_board
    description.each_with_index.map do |row,i|
      row.each_with_index.map do |element, j|
        reveal_hit_ships(element, [i,j])
      end
    end
  end

  private
  attr_reader :ships

  def reveal_hit_ships(element, position)
    unless element == SEA || element == :miss
      element.position[position] == :hit ?  :hit : SEA
    else
      element
    end
  end

  # given starting point places to the right
  def place_horizontally(ship, y_coord, x_coord)
    check_ship_fits_on_board(x_coord, ship, description)
    check_ship_already_exists_in_same_row(ship, y_coord, x_coord )

    (1..ship.size).each do |amount_of_ship_parts|
      stored_x_coord = x_coord + amount_of_ship_parts - 1

      @description[y_coord][stored_x_coord] = ship
      ship.store_location(y_coord, stored_x_coord)
    end
  end

  # Given starting point places downwards
  def place_vertically(ship, y_coord, x_coord)
    check_ship_fits_on_board(y_coord, ship, description)
    check_ship_already_exists_in_same_column(ship, y_coord, x_coord )

    (1..ship.size).each do |amount_of_ship_parts|
      stored_y_coord = y_coord + amount_of_ship_parts - 1

      @description[stored_y_coord][x_coord] = ship
      ship.store_location(stored_y_coord, x_coord)
    end
  end

  # def place_by_orientation(orientation,ship, y_coord, x_coord)
  #   check_ship_fits_on_board(y_coord, ship, description)
  #   check_ship_already_exists_in_same_column(ship, y_coord, x_coord )
  #
  #   (1..ship.size).each do |amount_of_ship_parts|
  #     if orientation == :vertical
  #       stored_y_coord = y_coord + amount_of_ship_parts - 1
  #       @description[stored_y_coord][x_coord] = ship
  #       ship.store_location(stored_y_coord, x_coord)
  #     else
  #       stored_x_coord = x_coord + amount_of_ship_parts - 1
  #       @description[y_coord][stored_x_coord] = ship
  #       ship.store_location(y_coord, stored_x_coord)
  #     end
  #   end
  # end

  def missed_ship(y_coord, x_coord)
    @description[y_coord][x_coord] = :miss
    return :miss
  end

  # checks that all parts of all the ships on the board, have been hit
  def all_ships_sunk?
    ships.collect(&:position).collect(&:values).flatten.uniq == [:hit]
  end

  #### Errors ####

  # Either the ship is out of bounds and/or the ship size pushes ship out of bounds
  def check_ship_fits_on_board(coord = nil, ship, description)
    raise "Out of bounds: starting position should be within game board boundary" if coord + ship.size > description.length
  end

  def check_ship_already_exists_in_same_row(ship, y_coord, x_coord )
    # Goes through row, and finds if ship exists in the space where new ship will go
    unless (0..ship.size-1).select {|ele| description[y_coord] [x_coord + ele] != SEA }.empty?
      raise "Ship already there: Choose another position so not overlap with a ship in that place"
    end
  end

  def check_ship_already_exists_in_same_column(ship, y_coord, x_coord )
    # Goes through column, and finds if ship exists in the space where new ship will go
    unless (0..ship.size-1).select {|ele| description[y_coord + ele][x_coord] != SEA }.empty?
      raise "Ship already there: Choose another position so not overlap with a ship in that place"
    end
  end
end
