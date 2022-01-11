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

  def can_build?(craft)
    counter = 0
    craft.supplies_required.keys.each do |supply| #for each supply of a given craft
      # require "pry" ; binding.pry
      if @supplies.has_key?(supply.to_s) #if a person has this supply
        if craft.supplies_required[supply] <= @supplies[supply.to_s]
        else
          return false
        end
      else #if person doesnt have this supply, immediately false
        return false
      end
    end
    return true
  end

end
