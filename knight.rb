require_relative 'piece'

class Knight < Piece
  attr_accessor :position

  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def initialize(position, color = :black)
    @position = position
    @color = color
  end

  def inspect
    (self.class).inspect
  end

  def to_s
    " k "
  end

  def moves(pos)
    moves = []
    cur_x, cur_y = pos
    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      moves << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
    end

    moves
  end
end
