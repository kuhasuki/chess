require_relative 'piece'

class King < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " K "
  end
end
