require 'bike'
require 'bike_container'
require 'van'

describe Van do

	let(:bike) {Bike.new}
	let(:van) {Van.new}

	it "should dock broken bikes" do
		bike = Bike.new.break!
		van.dock(bike)
		expect{van.dock(bike)}.to change{van.bike_count}.by +1
	end

	it "should release fixed bikes" do
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end
end