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
    false
  end

  def rotate_player!

  end
end

b = Board.new
c = ChessGame.new(b)
c.run
