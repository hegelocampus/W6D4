require_relative "piece.rb"

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

module Slideable

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |d_pos|
      moves += grow_unblocked_moves_in_dir(d_pos)
    end
  end

  private

  HORIZONTAL_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ].freeze

  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos.dup
    moves =[]

    loop do
      cur_x += dx
      cur_y += dy
      break unless board.valid_pos?(pos)

      moves << [cur_x, cur_y]
      break unless board[pos].empty?
    end

    moves
  end
end
  
