require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class ChessGame
  def initialize(board, player1, player2)
    @board = board
    @display = Display.new(@board)
    @current_player_color = :black
  end

  def run
    until over?
      @board.update_values
      play_turn
      rotate_player!
    end
    @display.render
    puts "Game over! #{@current_player_color.to_s.capitalize} loses!"
  end

  def play_turn
    start, end_pos = nil, nil
    until @board.valid_move?(start, end_pos)
      start = prompt_pos
      start = prompt_pos until piece_at?(start) && my_piece?(start)
      end_pos = prompt_pos
      end_pos = prompt_pos until end_pos != start
    end

    @board.move(start, end_pos)
  end

  def notify_check
    puts "#{@current_player_color.to_s.capitalize} is in check!"
  end

  def prompt_pos
    pos = nil
    until pos
      @display.render
      puts
      notify_check if @board.in_check?(@current_player_color)
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
p1 = HumanPlayer.new(b)
p2 = HumanPlayer.new(b)
c = ChessGame.new(b, p1, p2)
c.run
