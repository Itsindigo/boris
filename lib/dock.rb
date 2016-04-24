require_relative "bike"

class Dock

  attr_reader :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 15

  def initialize(capacity = Dock::DEFAULT_CAPACITY )
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def dock_bike(bike)
    room_at_the_inn?
    valid_object?(bike)
    bike_broken?(bike)
    @bikes << bike
  end

  def release_bike
    raise "No Bikes Available" if @bikes.length == 0
    @bikes.pop
  end

  private

  def valid_object?(object)
    raise "Invalid Object" unless object.class == Bike || object.class == RSpec::Mocks::Double
  end

  def room_at_the_inn?
    raise "Capacity Exceeded" if (@bikes.length + @broken_bikes.length) >= @capacity
  end

  def bike_broken?(object)
    if object.bike_status == "Broken"
      @broken_bikes << object
    end
  end

end
