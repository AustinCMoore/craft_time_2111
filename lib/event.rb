class Event
attr_reader :name,
            :crafts,
            :attendees

  def initialize(name, craft, person)
    @name = name
    @crafts = [craft]
    @attendees = [person]
  end

  def attendee_names
    @attendees.flatten.map do |attendee| #why do i have to flatten this
      attendee.name
    end
  end

  def craft_with_most_supplies #select would probably be better
    craft_pair = @crafts.flatten.map do |craft|
      [craft.supplies_required.length, craft.name]
    end
    craft_pair.to_h.max.last
  end

  def supply_list
    list = @crafts.flatten.map do |craft|
      craft.supplies_required.keys
    end
    return list.flatten.uniq.map do |supply|
      supply.to_s
    end
  end
end
