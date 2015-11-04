class ComputerPlayer
  attr_reader :color

  def initialize(board, display, color = :black)
    @board, @display, @color = board, display, color
  end

  def prompt
    possibilities = generate_possibilities
    start = possibilities.keys.sample
    end_pos = possibilities[start].sample
    [start, end_pos]
  end

  def generate_possibilities
    possibilities = Hash.new
    @board.grid.flatten.each do |piece|
      next if piece.color != @color
      unless piece.moves.empty?
        possibilities[piece.position] = piece.moves
      end
    end
    possibilities
  end

end
