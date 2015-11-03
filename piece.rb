class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, position, color)
    @board, @position, @color = board, position, color
  end
end
