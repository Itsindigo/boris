require 'repair_van'

RSpec.describe RepairVan do

  subject(:repair_van) {described_class.new}

  it "should receive an array of broken bikes from a docking station" do
    dock = double("dock")
    bike = double("bike")
    expect(dock).to receive(:broken_bikes).with([bike])
    allow(repair_van).to receive(:collect_broken_bikes).with(dock)
    repair_van.collect_broken_bikes(dock)
  end
end
