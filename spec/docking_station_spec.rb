require 'docking_station'
require 'bike_container'

describe DockingStation do 

let(:station) { DockingStation.new(:capacity => 20) }

it "should allow setting default capacity on initialising" do 
	expect(station.capacity).to eq(20)
	end
end
#it "should know which bikes are broken" do
	#broken_bike = Bike.new.break!
	#expect(bike_count).to change by +1
	#broken_bike.bike_count
#end