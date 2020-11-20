class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @value = 0
  end

  def value
    aces = 0
    @cards.each do |card|
      if numeric?(card)
        @value += card.value
      elsif face?(card)
        @value += 10
      else
        aces += 1
      end
  end

  def face?(card)
    ['J', 'Q', 'K'].include?(card.value)
  end

  def numeric?(card)
    card.value.is_a? Numeric
  end

  def to_s
    @cards.map { |card| "#{card.value}#{card.suit} " }.join
  end
end
