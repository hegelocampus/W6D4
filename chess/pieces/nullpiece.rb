require_relative "piece.rb"
require "singleton"

class Nullpiece < Piece

  include Singleton

  def initialize
    
  end

  def symbol
    " "
  end

  def color
    nil
  end
end
