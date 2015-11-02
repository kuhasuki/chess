require_relative 'piece'

class Rook < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " R "
  end
end
