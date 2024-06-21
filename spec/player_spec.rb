require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

    @player = Player.new('Clarisa', @deck)
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

  it "has attributes" do
    expect(@player.name).to eq('Clarisa')
    expect(@player.deck).to eq(@deck)
  end

end
