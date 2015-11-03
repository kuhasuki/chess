class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, position, color)
    @board, @position, @color = board, position, color
  end

  def dup(duped_board)
    self.class.new(duped_board, @position.dup, @color)
  end

  def moves(pos)
    possible_move_set(pos).reject { |move| in_check_moves.include?(move) }
  end

  def in_check_moves
    in_check_moves = []
    possible_move_set(@position).each do |move|
      duped_board = @board.dup
      start_pos = @position.dup
      duped_board.move!(start_pos, move)
      in_check_moves << move if duped_board.in_check?(@color)
    end
    in_check_moves
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

  def enemy?(move)
    @board[move].color != @color && @board[move].color != nil
  end

  def empty_tile?(move)
    @board[move].color.nil?
  end
end
