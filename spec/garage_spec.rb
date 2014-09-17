require 'bike_container'
require 'bike'
require 'garage'

describe Garage do

let(:bike) { Bike.new }
let(:garage) { Garage.new }

#garage needs to fix broken bikes
it "should fix broken bikes on arrival" do

garage.accept(bike)
expect(bike).not_to be_broken
end

it "should release fixed bikes to van" do
	garage.dock(bike)
	expect{garage.release(bike)}.to change{garage.bike_count}.by -1
	end
end

# garage needs to accept broken bikes and fix them
# garage needs to release fixed bikes to van
