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
    play_turn until over?
    @display.render
    puts "Game over! #{@current_player_color} loses!"
  end

  def play_turn
    start = prompt_pos
    start = prompt_pos until piece_at?(start) && my_piece?(start)
    end_pos = prompt_pos
    end_pos = prompt_pos until end_pos != start
    @board.move(start, end_pos) if @board.valid_move?(start, end_pos)
    rotate_player!
  end

  def prompt_pos
    pos = nil
    until pos
      @display.render
      puts "#{@current_player_color.to_s.capitalize}'s turn now."
      pos = @display.get_input
    end
    pos
  end

  def over?
    @board.checkmate?(@current_player_color)
  end

  def rotate_player!
    if @current_player_color == :black
      @current_player_color = :white
    else
      @current_player_color = :black
    end
  end

  def piece_at?(pos)
    @board[pos].class != NilPiece
  end

  def my_piece?(pos)
    @board[pos].color == @current_player_color
  end

end


b = Board.new
c = ChessGame.new(b)
# d = b.dup
# p b
# p d
c.run
