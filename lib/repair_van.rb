require_relative 'dock'

class RepairVan

  attr_reader :capacity, :stored_bikes

  def initialize
    @capacity = 6
    @stored_bikes = []
  end

  def collect_broken_bikes(dock)
    dock.broken_bikes.each do |bike|
      @stored_bikes << bike
    end
    update_stored_bikes
  end

  private

  def update_stored_bikes
    @stored_bikes.map {|x| x.in_transit}
  end
end
