require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'nil_piece'

class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, position, color)
    @board, @position, @color = board, position, color
  end
end
