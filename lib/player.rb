class Player
  def initialize(board)
    @board = board.create_board
  end

  def get_board
    @board
  end
end
