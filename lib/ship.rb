class Ship
  attr_reader :size, :position

  DEFAULT_SIZE = 1

  def initialize(size = DEFAULT_SIZE)
    @size = size
    @position = []
  end

  def store_location(y_coord, x_coord)
    @position << [y_coord, x_coord]
  end
end
