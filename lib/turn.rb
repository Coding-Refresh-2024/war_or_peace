class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(2).nil? == true || @player2.deck.rank_of_card_at(2).nil? == true
      :draw

    elsif @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) && @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :mutually_assured_destruction

    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end

    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end

    elsif self.type == :mutually_assured_destruction
      "No Winner"

    elsif self.type == :draw
      if @player1.deck.cards.length > @player2.deck.cards.length
        @player1
      else
        @player2
      end
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    elsif self.type == :war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    else
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
    end
  end

  def award_spoils(winner)

    if winner != "No Winner"
      @spoils_of_war.each do |card|
        winner.deck.cards << card
      end
    end
    @spoils_of_war = []
  end

end
