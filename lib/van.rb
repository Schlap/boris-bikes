require_relative "bike_container"

class Van

	include BikeContainer

	def collect(bike)
		dock(bike)
	end
end