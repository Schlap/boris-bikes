require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	def fill_holder(holder)
		holder.capacity.times {holder.dock(Bike.new)}
	end

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	it "should accept a bike" do
		#we expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		#let's dock a bike into the holder
		holder.dock(bike)
		# now we expect the holder to have 1 bike
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		holder.capacity.times { holder.dock(Bike.new) }
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda { holder.dock(bike) } ).to raise_error(RuntimeError)
	end

	it "should provide list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should provide a list of unavailable bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.unavailable_bikes).to eq([broken_bike])
	end

	it "should raise error if trying to release bike that does not exist" do
	expect(lambda{holder.release("Hello")} ).to raise_error(/This is not a real Bike!/)
 	end
end
