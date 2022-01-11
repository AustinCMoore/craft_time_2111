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

  it "adds supplies" do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

end
