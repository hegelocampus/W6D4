require_relative "piece.rb"
class Rook < Piece
    def initialize(color, board, pos)
      super  
    end

    def symbol
      
    end

    protected 

    def move_dirs

    end
end

class Bishop < Piece
    def initialize(color, board, pos)
      super 
    end

    def symbol
      :B
    end

    protected 

    def move_dirs

    end
end

class Queen < Piece
    def initialize(color, board, pos)
      super 
    end

    def symbol
      :Q
    end

    protected 

    def move_dirs

    end
end

module Slideable
  private 

  HORIZONTAL_DIRS = []

  DIAGONAL_DIRS = []

  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end
  
end