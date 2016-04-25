require 'dock'

RSpec.describe Dock do

  subject(:dock) {described_class.new}
  let(:bike) { double Bike.new, bike_status: "Working"}
  let(:broken_bike) { double Bike.new, bike_status: "Broken"}

  describe 'Bike Management' do

    it "should contain an array of bikes" do
      expect(dock.bikes.class).to eq(Array)
    end

    it "should accept a bike" do
      expect{dock.dock_bike(bike)}.to change{dock.bikes.count}.by(1)
    end

    it "should raise an error if there are no bikes available" do
      expect{dock.release_bike}.to raise_error("No Bikes Available")
    end

    it "should push a broken bike to a separate array" do
      expect{dock.dock_bike(broken_bike)}.to change{dock.broken_bikes.count}.by(1)
    end

    it "should release a bike" do
      dock.dock_bike(bike)
      expect{dock.release_bike}.to change{dock.bikes.count}.by(-1)
    end

    it "should not accept a non-bike object" do
      expect{dock.dock_bike("A string")}.to raise_error("Invalid Object")
    end
  end

  describe 'Capacity' do
    small_dock = described_class.new(2)

    it "should have a capacity that defaults to constant" do
      expect(dock.capacity).to eq(15)
    end

    it "should have a capacity that can be specified" do
      expect(small_dock.capacity).to eq(2)
    end

    it "should raise an error if expanded beyond capacity" do
      small_dock.capacity.times {small_dock.dock_bike(bike)}
      expect{small_dock.dock_bike(bike)}.to raise_error("Capacity Exceeded")
    end
  end
end
