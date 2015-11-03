require_relative 'piece'

class Knight < Piece

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

  def valid_for_me?(move)
    @board[move].color != @color
  end

  def moves(pos)
    moves = []
    cur_x, cur_y = pos
    DELTAS.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      moves << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
    end
    moves.select { |move| valid_for_me?(move) }
  end
end
