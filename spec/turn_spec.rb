require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '8', 8)

    @cards1 = [@card1, @card2, @card5, @card8]
    @cards2 = [@card3, @card4, @card6, @card7]

    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)

    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  it 'exists and has readable attributes' do
    expect(@turn).to be_an_instance_of(Turn)
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "checks the turn type" do
    expect(@turn.type).to eq(:basic)

    @turn.player2.deck.remove_card

    expect(@turn.type).to eq(:war)

    @turn.player2.deck.cards.pop
    @turn.player2.deck.add_card(@card9)

    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it "checks to see who wins the current turn" do
    expect(@turn.winner).to eq(@player1)

    @turn.player2.deck.remove_card

    expect(@turn.winner).to eq(@player1)

    @turn.player2.deck.cards.pop
    @turn.player2.deck.add_card(@card9)

    expect(@turn.winner).to eq("No Winner")
  end

  it "sends cards to the spoils of war array based on turn type :basic" do
    expect(@turn.spoils_of_war).to eq([])
    expect(@turn.type).to eq(:basic)

    @turn.pile_cards

    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  it "sends cards to the spoils of war array based on turn type :war" do
    expect(@turn.spoils_of_war).to eq([])

    @turn.player2.deck.remove_card

    expect(@turn.type).to eq(:war)

    @turn.pile_cards

    expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card6, @card7])
  end

  it "sends cards to the spoils of war array based on turn type :mutually_assured_destruction" do
    expect(@turn.spoils_of_war).to eq([])
    expect(@turn.player1.deck.cards.count).to eq(4)
    expect(@turn.player2.deck.cards.count).to eq(4)

    @turn.player2.deck.remove_card
    @turn.player2.deck.cards.pop
    @turn.player2.deck.add_card(@card9)

    @turn.pile_cards

    expect(@turn.spoils_of_war).to eq([])
    expect(@turn.player1.deck.cards.count).to eq(1)
    expect(@turn.player2.deck.cards.count).to eq(0)
  end

  it "awards the spoils_of_war to the current turn winner" do
    expect(@turn.spoils_of_war).to eq([])
    expect(@turn.player1.deck.cards.count).to eq(4)
    expect(@turn.player2.deck.cards.count).to eq(4)
    expect(@turn.type).to eq(:basic)

    winner = @turn.winner
    @turn.pile_cards

    expect(@turn.spoils_of_war).to eq([@card1, @card3])
    expect(@turn.player1.deck.cards.count).to eq(3)
    expect(@turn.player2.deck.cards.count).to eq(3)

    @turn.award_spoils(winner)

    expect(@turn.spoils_of_war).to eq([])
    expect(@turn.player1.deck.cards.count).to eq(5)
    expect(@turn.player2.deck.cards.count).to eq(3)
  end
end
