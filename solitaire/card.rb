##IMPORTANT: the show method within the card class must return self, this is so that the card can be revealed as it is placed onto the board

class Card

  attr_reader :val, :shown, :face

  CARD_VALS = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King]

  def initialize(suit, value)
    @suit = suit
    @face = value
    @val = cal_val(value)
    @shown = false
  end

  def reveal
    @shown = true
    self
  end

  def to_s
    shown ? face.to_s.first : " "
  end

  private

  def cal_val(val)
    CARD_VALS.index(val)
  end
  
end
