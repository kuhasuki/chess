require_relative 'piece'

class Pawn < Piece
  def initialize(board, position, color)
    super
    @first_move_taken = false
  end

  def position=(pos)
    @first_move_taken = true
    @position = pos
  end

  def moves(pos)
    if color == :black
      moves = generate_move_set([[1, -1], [1, 1], [1, 0], [2, 0]])
    elsif color == :white
      moves = generate_move_set([[-1, -1], [-1, 1], [-1, 0], [-2, 0]])
    end

    valid_for_me(moves)
  end

  def generate_move_set(deltas)
    move_set = []
    deltas.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      move_set << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
    end
    move_set
  end

  def valid_for_me(moves)
    validated_moves = []
    moves[0..1].each do |diagonal|
      unless @board[diagonal].color == @color || @board[diagonal].color.nil?
        validated_moves << diagonal
      end
    end

    # if forward 1
    # if forward 2
    # return false unless @board[move].color == @color
  end

  def to_s
    icon = "\u2659".encode("utf-8")
    " #{icon} "
  end
end
