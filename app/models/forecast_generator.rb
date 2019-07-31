class ForecastGenerator
	def initialize(params)
		@params = params
	end

	def get_forecast
		coords = GoogleGeocodingService.new(@params).get_coords
		forecast_data = DarkSkyService.new(coords).get_forecast
		Forecast.new(forecast_data)
	end

	def get_future_forecast(seconds)
		coords = GoogleGeocodingService.new(@params).get_coords
		future_cast = DarkSkyService.new(coords).get_future_forecast(seconds)
		forecast = Forecast.new(future_cast)
		{ data: { expected_temp: forecast.current_temp, 
			summary: forecast.current_summary, 
			travel_time: (Time.at(seconds).utc.strftime("%H:%M:%S")) }}.to_json	
	end
end

