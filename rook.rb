require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  DELTAS = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1]
  ]

  def to_s
    icon = "\u2656".encode("utf-8")
    " #{icon} "
  end

  def deltas
    DELTAS
  end
end
