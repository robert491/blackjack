class Hand
  MAX_VALUE = 21
  ACE_EXCEEDS = 10
  VALUES = {
    '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11
  }

  attr_reader :value, :cards

  def initialize(cards)
    @cards = cards
    @value = 0
    calculate
  end

  def calculate
    @value = @cards.sum { |card| VALUES[card.face] }
    verify_ace
  end

  def verify_ace
    count_ace.times do
      @value -= ACE_EXCEEDS if exceeding?
    end
  end

  def count_ace
    @cards.count { |card| card.face == 'A' }
  end

  def ace?
    count_ace.positive?
  end

  def exceeding?
    @value > MAX_VALUE
  end
end
