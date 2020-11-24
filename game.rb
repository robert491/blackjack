require_relative 'player'
require_relative 'deck'
require_relative 'terminal_interface'

class Game
  attr_reader :bank, :player, :dealer

  def initialize
    @interface = TerminalInterface.new
    @bank = 0
    @deck = Deck.new
    @player = Player.new(@interface.ask_player_name)
    @dealer = Player.new
    gameflow
  end

  def gameflow
    deal
    @interface.show_hands(@player, @dealer)
    first_bet
  end

  def deal
    @player.hand = @deck.deal
    @dealer.hand = @deck.deal
  end

  def first_bet
    @player.money -= 10
    @dealer.money -= 10
    @bank += 20
  end
end
