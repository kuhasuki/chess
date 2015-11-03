require_relative 'piece'

module SteppingPiece

  def moves(pos)
    moves = []
    cur_x, cur_y = pos
    DELTAS.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      moves << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
    end
    moves.select { |move| valid_for_me?(move) }
  end

  def valid_for_me?(move)
    @board[move].color != @color
  end
end
