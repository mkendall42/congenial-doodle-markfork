require './lib/visitor.rb'
require './lib/ride.rb'
require './lib/carnival.rb'
require 'pry'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("Carnavahl", 11)     #Creed Bratton style
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$11')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor4 = Visitor.new('Epinepherine', 72, '$50')
    @visitor5 = Visitor.new('Moneybags', 60, '$144')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:gentle)
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)
    @visitor5.add_preference(:gentle)
    @visitor5.add_preference(:thrilling)
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

  it "can add and list rides" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end

  it "can determine most popular ride" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    #Board a bunch of rides (exceptions noted):
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor4)     #3
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor3)
    @ride2.board_rider(@visitor3)     #4
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)     #5

    # binding.pry

    expect(@carnival.most_popular_ride()).to eq(@ride3)

    @ride2.board_rider(@visitor5)
    @ride2.board_rider(@visitor5)

    # binding.pry

    expect(@carnival.most_popular_ride()).to eq(@ride2)
  end

  it "can determine most profitable ride, and calculate total revenue for all rides" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    #I'm getting tired of carefully tracking when a visitor runs of out cash, etc...so bring in 'ol Moneybags to help:
    @ride1.board_rider(@visitor5)
    @ride1.board_rider(@visitor5)
    @ride2.board_rider(@visitor5)
    @ride2.board_rider(@visitor5)
    @ride3.board_rider(@visitor5)
    @ride3.board_rider(@visitor5)
    expect(@carnival.most_profitable_ride()).to eq(@ride2)

    @ride3.board_rider(@visitor5)
    @ride3.board_rider(@visitor5)
    @ride3.board_rider(@visitor5)
    @ride3.board_rider(@visitor5)
    expect(@carnival.most_profitable_ride()).to eq(@ride3)

    expect(@carnival.total_revenue()).to eq(24)
  end


end
