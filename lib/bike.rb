class Bike

  attr_reader :bike, :bike_status

  def initialize
    @bike
    @bike_status = "Working"
  end

  def working?
    @bike_status
  end

  def report_broken
    @bike_status = "Broken"
  end

  def in_transit
    @bike_status = "In Transit"
  end
end
