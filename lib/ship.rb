class Ship
  attr_reader :size, :position

  DEFAULT_SIZE = 1

  def initialize(size = DEFAULT_SIZE)
    @size = size
    @position = {}
  end

  def store_location(y_coord, x_coord)
    @position[[y_coord, x_coord]] = :working
  end

  def change_status(y_coord, x_coord)
    @position[[y_coord, x_coord]] = :hit
  end

  def hit_or_sunk
    position.values.uniq == [:hit] ? :ship_sunk : :hit
  end
end
