require_relative 'player'
require_relative 'deck'
require_relative 'terminal_interface'
require_relative 'bank'

class Game
  include Bank

  def initialize
    @interface = TerminalInterface.new
    @bank = Bank::GAME_BANK
    @deck = Deck.new
    @player = Player.new(@interface.ask_player_name)
    @dealer = Player.new
    gameflow
  end

  def gameflow
    deal
    show_hand
    first_bet
    player_moves
    dealer_moves
    open_all_hands
    result
    deal_the_bank(winner)
    what_next
  end

  def deal
    @player.hand = @deck.deal
    @dealer.hand = @deck.deal
  end

  def first_bet
    @player.bank -= Bank::BET
    @dealer.bank -= Bank::BET
    @bank += Bank::DUO_BET
    show_banks
  end

  def player_moves
    case @interface.ask_player_move
    when 2
      hit(@player)
    when 3
      open_all_hands
    end
  end

  def dealer_moves
    hit(@dealer) if @dealer.hand.value < 17
  end

  def hit(player)
    player.hand.cards += [@deck.hit] if player.hand.cards.size == 2
    @interface.tell_about_move(player)
  end

  def show_hand
    @interface.show_hand(@player, @dealer)
  end

  def show_banks
    @interface.show_banks(@player, @dealer)
  end

  def open_all_hands
    @interface.open_all_hands(@player, @dealer)
  end

  def winner
    if @player.hand.exceeding? && !@dealer.hand.exceeding?
      @dealer
    elsif !@player.hand.exceeding? && @dealer.hand.exceeding?
      @player
    elsif @player.hand.exceeding? && @dealer.hand.exceeding? || @player.hand.value == @dealer.hand.value
      nil
    else
      @player.hand.value > @dealer.hand.value ? @player : @dealer
    end
  end

  def deal_the_bank(winner)
    if winner.nil?
      @player.bank += Bank::BET
      @dealer.bank += Bank::BET
    else
      winner.bank += @bank
    end
    @bank = Bank::GAME_BANK
    show_banks
  end

  def result
    @interface.announce_the_winner(winner)
  end

  def what_next
    gameflow if @interface.ask_player_to_continue == 1
    @deck = Deck.new
  end
end
