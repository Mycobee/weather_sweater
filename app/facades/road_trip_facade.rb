class RoadTripFacade
	def initialize(trip_params)
		@origin = trip_params[:origin]
		@destination = trip_params[:destination]
		@api_key = trip_params[:api_key]
	end

	def verify_key
		user = User.find_by(api_key: @api_key)
		!user.nil?
	end

	def make_directions_params
		{ 'start' => @origin,	
		 'end' => @destination
		}
	end

	def get_trip_seconds
		GoogleDirectionsService.new(make_directions_params).get_trip[:routes][0][:legs][0][:duration][:value]
	end	

	def get_forecast
		if verify_key
			seconds = get_trip_seconds	
			ForecastGenerator.new({ 'location' => @destination }).get_future_forecast(seconds)
		else	
			json_api_error_response	
		end
	end

	def json_api_error_response
    status        = 401
    content_type  = 'application/json'
    { errors: [{ status: '401', title: "Unauthorized" }]}.to_json
  end
end

