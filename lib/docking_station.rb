class DockingStation
  attr_reader :bikes, :capacity
  attr_accessor :total_bikes, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    #@total_bikes = @bikes.concat(@broken_bikes)
    @total_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "sorry no bikes available" if empty?
    if @total_bikes[bikes.length-1].working
      return @total_bikes.pop
    else
      raise "This bike is faulty"
    end
  end

  def dock_bike(b, status = nil)
    fail "sorry this station is full" if full?
    #fail "Can't dock the same bike multiple times" if duplicate?
    @total_bikes.push b
    if status == 'broken'
      b.working = false
      @broken_bikes << b
    else
      @bikes << b
    end
  end

  def stored_broken_bikes
    @broken_bikes
  end

  private

  def full?
    @total_bikes.length == @capacity
  end

  def empty?
    @total_bikes.length == 0
  end


  #def duplicate?
    #@bikes.uniq.length != @bikes.length
  #end

end
