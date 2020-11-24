require_relative 'text'

class TerminalInterface
  include Text

  def ask_player_name
    puts welcome
    gets.strip
  end

  def show_hands(player, dealer)
    player_hand = player.hand.cards.map { |card| "#{card.face}#{card.suit}" }.join
    dealer_hand = dealer.hand.cards.map { |card| "#{card.face}#{card.suit}" }.join
    puts <<~TEXT
      #{player.name} - #{player_hand} (#{player.hand.value})
      #{dealer.name} - * *
    TEXT
  end

end
