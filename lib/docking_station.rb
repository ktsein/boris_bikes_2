class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "sorry no bikes available" if empty?
    return @bikes.pop
  end

  def dock_bike(bikes)
    fail "sorry this station is full" if full?
    @bikes.push bikes
  end

  private

  def full?
    @bikes.length == 20
  end

  def empty?
    @bikes.length == 0
  end

end

class Bike
  def working?
    true
  end
end
