require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  before (:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", @craft, @person)
  end

  it "exists" do
    expect(@event).to be_instance_of Event
  end

  it "has a name" do
    expect(@event.name).to be_instance_of String
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it "has crafts" do
    expect(@event.crafts).to be_instance_of Array
    expect(@event.crafts).to eq([@craft])
  end

  it "has attendees" do
    expect(@event.attendees).to be_instance_of Array
    expect(@event.attendees).to eq([@person])
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

  it "returns attendee names" do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  xit "returns craft with most supplies" do
    expect(@event.craft_with_most_supplies).to be_instance_of Array
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  xit "returns supply list" do
    expect(@event.supply_list).to be_instance_of Array
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  xit "builds if a person has the supplies for a craft" do
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
