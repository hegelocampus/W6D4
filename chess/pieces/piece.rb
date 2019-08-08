
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
      (0..7).each { |y| moves << [x, y] }
    end
    moves
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    :symbol
  end

  private

  def move_into_check?(end_pos)

  end
end