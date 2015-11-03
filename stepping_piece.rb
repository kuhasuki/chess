require_relative 'piece'

module SteppingPiece
  def moves(pos)
    moves = []
    cur_x, cur_y = pos
    deltas.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      moves << new_pos if valid_move?(new_pos)
    end
    moves
  end

  def valid_move?(move)
    in_bound?(move) && !teammate?(move)
  end

  def in_bound?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end

  def teammate?(move)
    @board[move].color == @color
  end

  def deltas
  end
end
