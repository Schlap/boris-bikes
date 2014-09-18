require 'docking_station'
require 'bike_container'

describe DockingStation do 

let(:station) { DockingStation.new(:capacity => 20) }

it "should allow setting default capacity on initialising" do 
	expect(station.capacity).to eq(20)
	end

it "should know when its empty" do
	expect(station).to be_empty
	end
end