class Card
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = ["\u{2666}", "\u{2665}", "\u{2660}", "\u{2663}"].freeze

  attr_reader :face, :suit

  def initialize(data)
    @face = data.first
    @suit = data.last
  end
end
