require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  DELTAS = [
    [-1, -1],
    [1, 1],
    [-1, 1],
    [1, -1]
  ]

  def deltas
    DELTAS
  end

  def to_s
    icon = "\u2657".encode("utf-8")
    " #{icon} "
  end

end
