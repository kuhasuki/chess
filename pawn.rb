require_relative 'piece'

class Pawn < Piece
  BLACK_DELTAS = [[1, -1], [1, 1], [1, 0], [2, 0]]
  WHITE_DELTAS = [[-1, -1], [-1, 1], [-1, 0], [-2, 0]]

  def initialize(board, position, color)
    super
    @first_move_taken = false
  end

  def position=(pos)
    @first_move_taken = true
    @position = pos
  end

  def moves(pos)
    deltas = color == :black ? BLACK_DELTAS : WHITE_DELTAS
    possible_moves = generate_move_set(deltas)
    valid_moves = valid_for_me(possible_moves)

    valid_moves.select { |move| in_bound?(move) }
  end

  def generate_move_set(deltas)
    cur_x, cur_y = @position
    deltas.map { |(dx, dy)| [cur_x + dx, cur_y + dy] }
  end

  def valid_for_me(moves)
    validated_moves = []

    moves[0..1].each do |diagonal|
      validated_moves << diagonal if enemy?(diagonal)
    end

    fwd_one = moves[2]
    validated_moves << fwd_one if @board[fwd_one].color.nil?

    fwd_two = moves[3]
    if @board[fwd_one].color.nil? && @board[fwd_two].color.nil?
      validated_moves << fwd_two unless @first_move_taken
    end

    validated_moves
  end

  def enemy?(move)
    @board[move].color != @color && !@board[move].color.nil?
  end

  def in_bound?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end

  def to_s
    icon = "\u2659".encode("utf-8")
    " #{icon} "
  end
end
