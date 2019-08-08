require_relative "piece.rb"
class Pawn < Piece
    def initialize(color, board, pos)
      super 
    end

    def symbol
      :P
    end

    def move_dirs

    end

    private

    def at_start_row?

    end

    def forward_dir #returns 1 or -1

    end

    def side_attacks

    end
end