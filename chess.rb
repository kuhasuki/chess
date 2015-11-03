# remember to pass current player to Display.rb to set default cursor position
require_relative 'board'
require_relative 'display'

class ChessGame
  def initialize(board)
    @board = board
    @display = Display.new(@board)
    @current_player_color = :black
  end

  def run
    until over?
      start = prompt_pos
      end_pos = prompt_pos
      @board.move(start, end_pos) if @board.valid_move?(start, end_pos)
      rotate_player!
    end
    puts "Game over!"
  end

  def prompt_pos
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end

  def over?
    @board.checkmate?(@current_player_color)
  end

  def rotate_player!

  end
end

b = Board.new
c = ChessGame.new(b)
# d = b.dup
# p b
# p d
c.run
