require_relative 'piece'

class Bishop < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " B "
  end

end
