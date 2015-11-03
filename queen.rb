require_relative 'piece'

class Queen < Piece
  attr_accessor :position

  def initialize(board, position, color = :black)
    @board = board
    @position = position
    @color = color
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    icon = "\u2655".encode("utf-8")
    " #{icon} "
  end
end
