require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class ChessGame
  attr_reader :display

  def initialize(board, player1_type, player2_type)
    @board = board
    @display = Display.new(@board)
    @player1 = create_player(player1_type, :black)
    @player2 = create_player(player2_type, :white)
    @current_player, @previous_player = @player1, @player2
  end

  def create_player(player_type, color)
    if player_type == "human"
      HumanPlayer.new(@board, @display, color)
    elsif player_type == "computer"
      ComputerPlayer.new(@board, @display, color)
    end
  end

  def run
    until over?
      @board.update_values
      play_turn
      rotate_player!
    end
    @display.render
    puts "Game over! #{@current_player.color.to_s.capitalize} loses!"
  end

  def play_turn
    start, end_pos = @current_player.prompt
    @board.move(start, end_pos)
  end

  def over?
    @board.checkmate?(@current_player.color)
  end

  def rotate_player!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end


b = Board.new
c = ChessGame.new(b, "human", "human")
c.run
