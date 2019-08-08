require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"

class Display
  def initialize(board)
    @board = board  
    @cursor = Cursor.new([0,0], board)
  end

  def render 
    @board.rows.each do |row|
      p row.map { |piece| piece.to_s }
    end
  end

  def inspect
    @board.rows.each do |row|
      row.map { |piece| piece.to_s }.inspect
    end
  end

  def get_input
    @cursor.get_input
  end

end