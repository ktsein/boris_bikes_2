class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "sorry no bikes available" if @bikes.length == 0
    return @bikes.pop
  end

  def dock_bike(bikes)
    fail "sorry this station is full" if @bikes.length >= 20
    @bikes.push bikes
  end
end

class Bike
  def working?
    true
  end
end
