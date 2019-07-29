class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :end_city
	has_many :businesses	
		
end
