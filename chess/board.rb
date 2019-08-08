require_relative "pieces/knight_king.rb"
require_relative "pieces/nullpiece.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/rook_bishop_queen.rb"
require 'byebug'
class Board

  attr_reader :rows

  def initialize
    @rows = rows_setup  # this is the board, rows combine to be a complete board
  end

  def rows_setup
    big_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pawns = [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn]
    (Array.new(8) { [] }).map.with_index do |row, idx_1|
      color = (idx_1 < 3 ? :black : :white)
      if [0, 7].include?(idx_1)
        big_pieces.map.with_index do |piece, idx_2|
          piece.new(color, self, [idx_1, idx_2])
        end
      elsif [1, 6].include?(idx_1)
        pawns.map.with_index do |piece, idx_2|
          piece.new(color, self, [idx_1, idx_2])
        end
      else 
        Array.new(8, Nullpiece.instance )
      end
    end
  end

  def [](pos)
    rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    self.rows[pos[0]][pos[1]] = val
  end

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos] #=> Rook.obj => Rook.pos = [end_pos]
    raise "invalid starting position" if piece.nil?
    raise "Invalid move" unless piece.valid_moves.include?(end_pos) && valid_pos?(end_pos)
    raise "Cannot move onto your own piece" if self[end_pos].color == color
    piece.pos= end_pos
    self[start_pos]= Nullpiece.instance
    self[end_pos]= piece
    self
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def in_check?(color)
    king_pos = find_king(color)
    rows.any? do |row|
      row.any? { |piece| piece.valid_moves.include?(king_pos) }
    end
  end

  def find_king(color)
    king_pos = []
    @rows.each_with_index do |row, idx_1|
      pos = row.index { |piece| piece.symbol == :k && piece.color == color}
      king_pos = [idx_1, pos] unless pos.nil?
    end
    king_pos
  end

  def checkmate?(color)
    return false unless in_check?(color)
    pieces.none? { |piece| piece.color == color && !piece.valid_moves.empty? }
  end

  def pieces
    rows.flatten.reject { |piece| piece.is_a?(Nullpiece) }
  end

  def dup
    new_board = self.dup
    new_board.rows = self.rows.map do |row|
      row.map do |piece| 
        new_piece = piece.dup
        new_piece.pos = piece.pos.dup
        new_piece
      end
    end
    new_board
  end

  def inspect
    Display.new(self).inspect
  end
end

# chess = Board.new 
# p chess.rows
