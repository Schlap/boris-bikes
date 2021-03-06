# link to the Bike class
require 'bike'

#we're describing the functionality of a specific class, Bike
describe Bike do
#this is a specific feature (behaviour)

let(:bike) { Bike.new }
#that we expect to be present
it "should not be broken after we create it" do
	expect(bike).not_to be_broken
	end

it "should be able to break" do
	bike.break!
	expect(bike).to be_broken
	end

it "should be able to get fixed" do
	bike.break!
	bike.fix!
	expect(bike).not_to be_broken
	end
end