require_relative 'piece'

class Knight < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " k "
  end

end
