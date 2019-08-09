require_relative "board.rb"
require "colorize"
require "byebug"
require_relative "cursor.rb"

class Display
  attr_reader :board

  def initialize(board)
    @board = board  
    @cursor = Cursor.new([0,0], board)
  end

  def render 
    system "clear"
    puts "+---+---+---+---+---+---+---+---+"
    @board.rows.each_with_index do |row, idx_1|
      arr = row.map.with_index do|piece, idx_2|
        if [idx_1, idx_2] == @cursor.cursor_pos
          piece.to_s.colorize(:color => :black, :background => :yellow)
        else
          piece.to_s
        end
      end
      puts '| ' + arr.join(' | ') + ' |'
      puts "+---+---+---+---+---+---+---+---+"
    end
  end

  

  def get_input
    @cursor.get_input
  end

  def inspect
    @board.rows.each do |row|
      row.map { |piece| piece.to_s }.inspect
    end
  end
end

cats = Display.new(Board.new)

#while cats
#  cats.render
#  cats.get_input
#end
cats.render
cats.board.move_piece(:black, [1,0], [6,4]) 
cats.render
cats.board.move_piece(:black, [0,0], [5,4]) 
cats.render
