require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

RSpec.describe Start do

  before :each do
    @start = Start.new()
  end

  it "exists" do
    expect(@start).to be_an_instance_of(Start)
  end

end
