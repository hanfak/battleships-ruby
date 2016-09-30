class Ship
  attr_reader :size

  DEFAULT_SIZE = 1

  def initialize(size = DEFAULT_SIZE)
    @size = size
  end
end
