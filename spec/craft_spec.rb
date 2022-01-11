require './lib/craft'

RSpec.describe Craft do
  before (:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it "exists" do
    expect(@craft).to be_instance_of Craft
  end

  it "has a name" do
    expect(@craft.name).to be_instance_of String
    expect(@craft.name).to eq("knitting")
  end

  it "has supplies required" do
    expect(@craft.supplies_required).to be_instance_of Hash
    expect(@craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end

RSpec.describe "Iteration 2" do
  before (:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it "builds if a person has the supplies for a craft" do
    @hector.can_build?(@sewing)
    expect(@hector.can_build?(@sewing)).to be_instance_of Boolean
    expect(@hector.can_build?(@sewing)).to eq(false)

    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    @hector.can_build?(@sewing)
    expect(@hector.can_build?(@sewing)).to eq(false)

    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    @hector.can_build?(@sewing)
    expect(@hector.can_build?(@sewing)).to eq(true)
  end
end
