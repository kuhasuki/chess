require_relative 'piece'

class King < Piece
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
    icon = "\u2654".encode("utf-8")
    " #{icon} "
  end
end
