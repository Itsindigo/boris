require 'repair_van'

RSpec.describe RepairVan do

  subject(:repair_van) {described_class.new}

  it "should receive an array of broken bikes from a docking station" do
    dock = double("dock")
    bike = double("bike")
    allow(dock).to receive(:broken_bikes).and_return([bike])
    broken = dock.broken_bikes
    expect(repair_van).to receive(:stored_bikes).and_return(broken)
    repair_van.stored_bikes
  end
end
