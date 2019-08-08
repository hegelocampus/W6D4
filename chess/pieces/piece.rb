
class Piece
  def initialize(color, board, pos)
    @color = color #symbol for color
    @board = board #Board class obj
    @pos = pos #array containing [y, x] position
  end

  def to_s
    symbol.to_s 
  end

  def empty?
    symbol.nil?
  end

  def valid_moves
    moves = []
    (0..7).each do |x|
      (0..7).each { |y| moves << [x, y] unless @board[[x, y]].color == color }
    end
    test_board = @board.dup
    moves.reject do |test_pos|
      test_board.move_piece(color, pos, test_pos)
      test_board.in_check?(color) 
    end
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    :symbol
  end

  def inspect
    symbol
  end

  private

  def move_into_check?(end_pos)

  end
end
