require './lib/visitor.rb'
require './lib/ride.rb'
require './lib/carnival.rb'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("Carnavahl", 11)     #Creed Bratton style
  end

  it "exists" do
    expect(@carnival).to be_a(Carnival)
  end

  it "initializes correctly" do
    expect(@carnival.name).to eq("Carnavahl")
    expect(@carnival.duration).to eq(11)
    expect(@carnival.rides).to eq([])
    expect(@carnival.total_revenue).to eq(0)
  end
  
end
