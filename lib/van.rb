require_relative "bike_container"

class Van

DEFAULT_CAPACITY = 5

def initialize(options = {})
	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
end

	include BikeContainer

	def accept(bike)
		broken_bike = bike.break!
		van.dock(broken_bike)
	end

	def recieve_broken_bikes(station)
		station.unavailable_bikes.each do |broken_bikes|
		dock(broken_bikes)
		station.release(broken_bikes)
	end
end

	def transfer(station)
		station.unavailable_bikes.each do |broken_bikes|
		dock(station.release(broken_bikes))
	end
end
end