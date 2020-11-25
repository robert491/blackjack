class Hand
  MAX_VALUE = 21
  ACE_EXCEEDS = 10
  VALUES = {
    '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11
  }.freeze

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def value
    verify_ace(@cards.sum { |card| VALUES[card.face] })
  end

  def verify_ace(points)
    count_ace.times do
      points -= ACE_EXCEEDS if points > 21
    end
    points
  end

  def count_ace
    @cards.count { |card| card.face == 'A' }
  end

  def ace?
    count_ace.positive?
  end

  def exceeding?
    value > MAX_VALUE
  end
end
