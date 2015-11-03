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

    valid_for_me(moves).select do |move|
      move.all? { |coord| coord.between?(0, 7) }
    end
  end

  def generate_move_set(deltas)
    cur_x, cur_y = @position
    deltas.map { |(dx, dy)| [cur_x + dx, cur_y + dy] }
  end

  def valid_for_me(moves)
    validated_moves = []

    moves[0..1].each do |diag|
      unless @board[diag].color == @color || @board[diag].color.nil?
        validated_moves << diag
      end
    end

    fwd_one = moves[2]
    validated_moves << fwd_one if @board[fwd_one].color.nil?

    fwd_two = moves[3]
    if @board[fwd_one].color.nil? && @board[fwd_two].color.nil?
      validated_moves << fwd_two unless @first_move_taken
    end

    validated_moves
  end

  def to_s
    icon = "\u2659".encode("utf-8")
    " #{icon} "
  end
end
