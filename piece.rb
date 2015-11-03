class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, position, color)
    @board, @position, @color = board, position, color
  end

  def dup(duped_board)
    self.class.new(duped_board, @position.dup, @color)
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

  def moves(pos)
    possible_move_set(pos).reject { |move| in_check_moves.include?(move) }
  end
end
