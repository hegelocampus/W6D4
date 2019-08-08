require_relative 'card.rb'

class Board
  def initialize
    @card_stacks = card_setup
    @deck = deck_setup
  end

  def display

  end

  private

  def card_setup
    stacks = Arr.new(7) { [] }

    ##This first iteration will be placing the hidden cards
    (1..6).each do |idx|
      idx.times do 
        stacks[idx] << @deck.pop
      end
    end

    #This second iteration is for placing the cards that will be visable at
    #the start of the game
    stacks.each do |stack|
      stack << @deck.pop.reveal
    end
  end

  def deck_setup
    deck = []
    suits = [:Diamonds, :Clovers, :Hearts, :Spades]
    face_cards = [:Jack, :Queen, :King, :Ace]
    (2..10).each do |num|
      suits.each do |suit|
        deck << Card.new(suit, num)
      end
    end

    face_cards.each do |face|
      suits.each do |suit|
        deck << Card.new(suit, face)
      end
    end
    deck.shuffle
  end
end
