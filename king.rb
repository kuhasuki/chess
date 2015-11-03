require_relative 'piece'

class King < Piece
  include SteppingPiece

  DELTAS = [
    [-1, -1],
    [-1,  0],
    [-1, 1],
    [ 0,  -1],
    [ 0, 1],
    [ 1,  -1],
    [ 1, 0],
    [ 1,  1]
  ]

  def deltas
    DELTAS
  end

  def to_s
    icon = "\u2654".encode("utf-8")
    " #{icon} "
  end
end
