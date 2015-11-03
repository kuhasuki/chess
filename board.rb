require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'nil_piece'

class Board
  attr_accessor :grid

  def initialize(original = true)
    @grid = Array.new(8) { Array.new(8) { NilPiece.new(nil, nil, nil) } }
    populate_board if original
  end

  def dup
    duped_board = self.class.new(false)
    @grid.each do |rows|
      rows.each do |piece|
        if piece.color != nil
          # duped_piece = 
          duped_board[piece.position] = piece.dup(duped_board)
        end
      end
    end
    duped_board
  end

  def populate_board
    insert_high_court(0, :black)
    insert_pawns(1, :black)

    insert_pawns(6, :white)
    insert_high_court(7, :white)
  end

  def insert_high_court(row, color)
    @grid[row][0] = Rook.new(self, [row, 0], color)
    @grid[row][7] = Rook.new(self, [row, 7], color)
    @grid[row][1] = Knight.new(self, [row, 1], color)
    @grid[row][6] = Knight.new(self, [row, 6], color)
    @grid[row][2] = Bishop.new(self, [row, 2], color)
    @grid[row][5] = Bishop.new(self, [row, 5], color)
    @grid[row][3] = Queen.new(self, [row, 3], color)
    @grid[row][4] = King.new(self, [row, 4], color)
  end

  def insert_pawns(row, color)
    (0..7).each do |col|
      @grid[row][col] = Pawn.new(self, [row, col], color)
    end
  end

  def move(start, end_pos)
    raise "No piece at selected starting position" if self[start].nil?
    raise "Invalid move" unless valid_move?(start, end_pos)

    move!(start, end_pos)
  end

  def move!(start, end_pos)
    piece = self[start]
    self[end_pos], self[start] = piece, NilPiece.new(nil, nil, nil)
    piece.position = end_pos
  end

  def valid_move?(start, end_pos)
    piece = self[start]
    possible_moves = piece.moves(start)
    possible_moves.include?(end_pos)
  end

  def in_check?(color)
    king_position = find_king(color)
    @grid.each do |rows|
      rows.each do |piece|
        if piece.color != nil && piece.color != color
          if piece.possible_move_set(piece.position).include?(king_position)
            return true
          end
        end
      end
    end
    false
  end

  def checkmate?(color)
    in_check?(color) && no_moves_left?(color)
  end

  def no_moves_left?(color)
    @grid.each do |rows|
      rows.each do |piece|
        if piece.color == color
          return false unless piece.moves(piece.position).empty?
        end
      end
    end
    true
  end

  def find_king(color)
    @grid.each do |rows|
      rows.each do |piece|
        if piece.class == King && piece.color == color
          return piece.position
        end
      end
    end
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, piece)
    row, col = position
    @grid[row][col] = piece
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end
end
