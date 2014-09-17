class Bike

	#the initialize method is always called when you create a new
	#class by typing Bike.new
	def initialize
		# all instance variables begin with "@"
		# this must be an instance variable because we'll need it
		# in other methods
	end


	def broken?
		# instance variables are accesible in all methods
		@broken
	end

	def break!
		# and any instance method can update them
		@broken = true
	end

	def fix!
		@broken = false
	end
end

