require_relative "bike_container"

class Van

	include BikeContainer
	def accept(bike)
		bike.break!
		dock(bike)
	#def collect(bike)
	end
end