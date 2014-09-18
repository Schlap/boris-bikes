require_relative "bike_container"

class Van

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
end