class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "sorry no bikes available" if empty?
    return @bikes.pop
  end

  def dock_bike(bike, status = nil)
    fail "sorry this station is full" if full?
    @bikes.push bike
    if status == 'broken'
      bike.working = false
    end
  end

  private

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.length == 0
  end

end
