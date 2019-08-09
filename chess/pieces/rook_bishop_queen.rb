require_relative 'slideable.rb'
require_relative 'piece.rb'

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :R
  end

  protected 

  def move_dirs

  end
end

class Bishop < Piece

  include Slideable

  def initialize(color, board, pos)
    super 
  end

  def symbol
    :B
  end

  private

  def move_dirs
    horizontal_dirs
  end
end

class Queen < Piece

  include Slideable

  def initialize(color, board, pos)
    super 
  end

  def symbol
    :Q
  end

  private

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end

