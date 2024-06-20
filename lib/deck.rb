class Deck

  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

end
