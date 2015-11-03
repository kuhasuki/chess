require_relative 'piece'

module SlidingPiece

  def moves(pos)
    moves = []
    cur_x, cur_y = pos
    deltas.each_with_index do |(dx, dy), direction|
      new_pos = [cur_x + dx, cur_y + dy]
      while valid_move?(new_pos)
        moves << new_pos
        break if enemy?(new_pos)
        new_pos = go_forward(new_pos, direction)
      end
    end
    moves
  end

  def valid_move?(move)
    in_bound?(move) && !teammate?(move)
  end

  def teammate?(move)
    @board[move].color == @color
  end

  def in_bound?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end

  def deltas
  end

  def enemy?(move)
    @board[move].color != @color && @board[move].color != nil
  end

  def go_forward(move, direction)
    dx, dy = deltas[direction]
    cur_x, cur_y = move
    [cur_x + dx, cur_y + dy]
  end

end
