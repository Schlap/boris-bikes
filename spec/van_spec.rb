require 'bike_container'
require 'bike'
require 'van'

describe Van do

#let(:bike) {Bike.new}
#needs to accept bikes from docking station and deliver to garage
#return fixed bikes to docking station
	it "should be able to collect broken bikes from docking station" do
		van = Van.new
		broken_bike = Bike.new.break!
		expect(van.bike_count).to eq(0)
		expect{van.collect(broken_bike)}.to change{van.bike_count}.by +1
	end
end