class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, position, color)
    @board, @position, @color = board, position, color
  end

  def dup(duped_board)
    self.class.new(duped_board, @position.dup, @color)
  end
end
