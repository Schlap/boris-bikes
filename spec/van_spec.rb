require 'bike'
require 'van'
require 'docking_station'

describe Van do

	let(:bike) {Bike.new}
	let(:van) {Van.new}
	let(:station) {DockingStation.new}

	#it "should dock broken bikes" do
		#bike = Bike.new.break!
		#van.dock(bike)
		#expect{van.dock(bike)}.to change{van.bike_count}.by +1
	#end

	it "should release fixed bikes" do
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end

	it "should recieve broken bikes from docking station" do
		bike.break!
		station.dock(bike)
		van.recieve_broken_bikes(station)
		expect(station.bike_count).to eq(0)
		expect(van.bike_count).to eq(1)
	end
end