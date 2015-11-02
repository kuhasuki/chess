require_relative 'piece'

class NilPiece < Piece
  def initialize(position = nil, color = nil)
    @position = position
  end

  def to_s
    "   "
  end
end
