require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

RSpec.describe Start do

  before :each do
    @start = Start.new('GO')
  end

  it "exists and has variables" do
    expect(@start).to be_an_instance_of(Start)
    expect(@start.input).to eq("GO")
  end

end
