require_relative 'piece'
require_relative 'steppingpiece'

class Knight < Piece
  include SteppingPiece

  DELTAS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def to_s
    icon = "\u2658".encode("utf-8")
    " #{icon} "
  end
end
