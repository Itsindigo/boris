require 'bike'

RSpec.describe Bike do

  bike = described_class.new

  it {is_expected.to respond_to(:working?)}

  it "should report the bike's working status" do
    expect(bike.working?).to eq("Working")
  end

  it "should change the working status of a bike to false" do
    expect{bike.report_broken}.to change{bike.bike_status}.from("Working").to("Broken")
  end

  it "should change the working status of bike to in transit" do
    expect{bike.in_transit}.to change{bike.bike_status}.to("In Transit")
  end
end
