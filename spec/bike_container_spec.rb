require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	def fill_holder(holder)
		holder.capacity.times {holder.dock(Bike.new)}
	end

	#Exclamation mark after let is called bang
	#and ensures that you are using the same instance
	let(:bike) {double :bike, broken?: false, :class => Bike}
	let(:holder) {ContainerHolder.new}

	it "should accept a bike" do
		expect{holder.dock(:bike)}.to change{holder.bike_count}.by 1
	end

	it "should release a bike" do
		holder.dock(bike)
		expect{holder.release(bike)}.to change {holder.bike_count}.by -1
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		holder.capacity.times { holder.dock(bike) }
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda { holder.dock(bike) } ).to raise_error(RuntimeError)
	end

	it "should provide a list of available bikes" do
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
