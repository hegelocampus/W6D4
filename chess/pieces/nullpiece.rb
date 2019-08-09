require_relative "piece.rb"
require "singleton"

class Nullpiece < Piece

  include Singleton

  def initialize
    @symbol = " "
    @color = :none
  end

  def symbol
    " "
  end

  def empty?
    true
  end

  def moves
    []
  end

  def color
    nil
  end
end
