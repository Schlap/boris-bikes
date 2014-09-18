module BikeContainer

DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		#if the capacity is reached raise an exception
		raise "Station is full" if full?
		@bikes << bike
	end

	def release(bike)
		raise "This is not a real Bike!" if bike.class != Bike
		bikes.delete(bike)
	end

	def not_bike
		bike = !Bike.new
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end

	def unavailable_bikes
		@bikes.select {|bike| bike.broken?}
	end	

	def empty?()
		bike_count == 0

	end
end