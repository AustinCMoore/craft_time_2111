require './lib/person'

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

end
