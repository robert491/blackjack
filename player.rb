require_relative 'bank'

class Player
  include Bank

  attr_reader :name
  attr_accessor :hand, :bank

  def initialize(name = 'Дилер')
    @name = name
    @bank = Bank::INITIAL_BANK
  end
end
