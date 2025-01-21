require './lib/visitor.rb'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it "exists" do
    expect(@visitor1).to be_a(Visitor)
  end

  it "initializes correctly" do
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq("$10")
    expect(@visitor1.preferences).to eq([])
  end

  it "can add and store preferences" do
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)

    expect(@visitor1.preferences).to eq([:gentle, :thrilling])

    expect(@visitor2.preferences).to eq([])

    @visitor2.add_preference(:agile)

    expect(@visitor2.preferences).to eq([:agile])
  end

  it "can verify if visitor is tall enough for a given ride" do
    expect(@visitor1.tall_enough?(54)).to eq(true)
    expect(@visitor2.tall_enough?(54)).to eq(false)
    expect(@visitor3.tall_enough?(54)).to eq(true)
    expect(@visitor1.tall_enough?(64)).to eq(false)
  end

  
end
