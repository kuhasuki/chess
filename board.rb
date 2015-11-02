class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    new_board
  end

  def new_board
    insert_high_court(0, :black)
    insert_pawns(1, :black)

    insert_pawns(6, :white)
    insert_high_court(7, :white)
  end
end
