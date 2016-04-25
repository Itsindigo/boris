require 'repair_van'

RSpec.describe RepairVan do

  subject(:repair_van) {described_class.new}
  let(:broken_bike_1) {double Bike.new, bike_status: "Broken"}
  let(:broken_bike_2) {double Bike.new, bike_status: "Broken"}
  let(:dock) { double Dock.new, broken_bikes: [broken_bike_1, broken_bike_2] }

  it "should receive an array of broken bikes from a docking station" do
    expect{repair_van.collect_broken_bikes(dock)}.to change{repair_van.stored_bikes.length}.by(2)
  end

end
