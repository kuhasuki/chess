require_relative 'piece'

class Queen < Piece
  def initialize(position, color)
    @position = position
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " Q "
  end
end
