require_relative 'text'

class TerminalInterface
  include Text

  def ask_player_name
    print what_is_your_name
    gets.chomp
  end

  def show_hand(player, dealer)
    player_hand = player.hand.cards.map { |card| "#{card.face}#{card.suit}" }.join
    dealer_hand = hidden_hand
    puts <<~TEXT
      #{player.name} - #{player_hand} (#{player.hand.value})
      #{dealer.name} - #{dealer_hand}
    TEXT
  end

  def show_banks(player, dealer)
    puts <<~TEXT
      #{bank_is(player)}
      #{bank_is(dealer)}
    TEXT
  end

  def ask_player_move
    print what_is_your_move
    gets.to_i
  end

  def tell_about_move(player)
    puts move_was_made_by(player)
  end

  def open_all_hands(player, dealer)
    player_hand = player.hand.cards.map { |card| "#{card.face}#{card.suit}" }.join
    dealer_hand = dealer.hand.cards.map { |card| "#{card.face}#{card.suit}" }.join
    puts <<~TEXT
      #{player.name} - #{player_hand} (#{player.hand.value})
      #{dealer.name} - #{dealer_hand} (#{dealer.hand.value})
    TEXT
  end

  def announce_the_victory(winner)
    puts victory(winner)
  end

  def announce_the_draw
    puts draw
  end

  def ask_player_to_continue
    puts do_you_want_to_continue
    gets.to_i
  end
end
