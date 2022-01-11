require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  before (:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it "exists" do
    expect(@person).to be_instance_of Person
  end

  it "has a name" do
    expect(@person.name).to be_instance_of String
    expect(@person.name).to eq("Hector")
  end

  it "has interests" do
    expect(@person.interests).to be_instance_of Array
    expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it "has no supplies to start" do
    expect(@person.supplies).to be_instance_of Hash
    expect(@person.supplies).to eq({})
  end

  it "adds supplies" do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
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
