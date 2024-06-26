require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'


RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "gets the card rank at element X" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
  end

  it "gets an array of cards with rank >= 11" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "returns a percent value of the high ranking cards in the deck" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "removes the top card from the deck" do
    expect(@deck.remove_card).to be(@card1)
  end

  it "adds a card to the bottom of the deck" do
    expect(@deck.cards.count).to eq(3)

    @deck.add_card(@card4)

    expect(@deck.cards.count).to eq(4)
    expect(@deck.cards.last()).to eq(@card4)
  end
end
