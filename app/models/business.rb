class Business
	def initialize(business_data, end_city)
		@name = business_data[:name]
		@address = business_data[:location][:address1]
	end
end
