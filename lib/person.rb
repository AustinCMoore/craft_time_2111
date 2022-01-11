class Person
attr_reader :name,
            :interests,
            :supplies

  def initialize(data)
    @name      = data[:name]
    @interests = data[:interests]
    @supplies  = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_supply(supply, qty)
    @supplies[supply] += qty
  end

end
