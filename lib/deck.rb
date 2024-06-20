class Deck

  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranks = []

    @cards.each do |card|
      if card.rank >= 11
        high_ranks << card
      end
    end

    return high_ranks
  end


end
