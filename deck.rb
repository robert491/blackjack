require_relative 'card'
require_relative 'hand'

class Deck
  def initialize
    @cards = Card::CARDS.product(Card::SUITS).shuffle
    @cards.map! { |card| Card.new(card) }
  end

  def deal
    Hand.new(@cards.pop(2))
  end

  def hit
    @cards.pop
  end
end
