module Text
  def what_is_your_name
    'Добро пожаловать в игру. Как вас зовут? '
  end

  def what_is_your_move
    'Ваш ход: пропустить(1), добавить карту(2), открыть карты(3): '
  end

  def draw
    'Ничья!'
  end

  def victory(winner)
    "Победил #{winner.name}!"
  end

  def move_was_made_by(player)
    "#{player.name} взял дополнительную карту."
  end

  def bank_is(player)
    "В банке #{player.name} #{player.bank}$."
  end

  def do_you_want_to_continue
    'Хотите сыграть еще? Да(1), нет(2): '
  end

  def hidden_hand
    '* *'
  end
end
