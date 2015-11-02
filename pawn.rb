require_relative 'piece'

class Pawn < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " P "
  end
end
